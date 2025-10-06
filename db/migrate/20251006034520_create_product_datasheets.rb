class CreateProductDatasheets < ActiveRecord::Migration[8.0]
  def change
    create_table :product_datasheets do |t|
      t.references :product, null: false, foreign_key: true
      t.references :datasheet, null: false, foreign_key: true

      t.timestamps
    end
    add_index :product_datasheets, [ :product_id, :datasheet_id ], unique: true
  end
end
