class CreateDatasheets < ActiveRecord::Migration[8.0]
  def change
    create_table :datasheets do |t|
      t.string :doc_no, null: false
      t.string :title, null: false
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
