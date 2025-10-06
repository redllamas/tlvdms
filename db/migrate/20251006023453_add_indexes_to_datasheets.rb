class AddIndexesToDatasheets < ActiveRecord::Migration[8.0]
  def change
    add_index :datasheets, :doc_no, unique: true
    add_index :datasheets, :status
  end
end
