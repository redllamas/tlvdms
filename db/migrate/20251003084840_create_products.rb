class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.string :category
      t.string :body_material
      t.string :applicable_fluids, array: true, default: []
      t.decimal :pmo, precision: 6, scale: 3
      t.integer :tmo
      t.decimal :pma, precision: 6, scale: 3
      t.integer :tma
      t.integer :status, null: false, default: 1   # enum draft/active/hidden/discontinued
      t.jsonb :extras, default: {}

      t.timestamps
    end

    add_index :products, :status
    add_index :products, :applicable_fluids, using: :gin

    # Optional but nice: non-negative checks
    reversible do |dir|
      dir.up do
        execute <<~SQL
          ALTER TABLE products
          ADD CONSTRAINT pmo_nonneg CHECK (pmo IS NULL OR pmo >= 0),
          ADD CONSTRAINT pma_nonneg CHECK (pma IS NULL OR pma >= 0),
          ADD CONSTRAINT tmo_nonneg CHECK (tmo IS NULL OR tmo >= 0),
          ADD CONSTRAINT tma_nonneg CHECK (tma IS NULL OR tma >= 0);
        SQL
      end
    end
  end
end
