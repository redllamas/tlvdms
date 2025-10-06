class CreateDatasheetRevisions < ActiveRecord::Migration[8.0]
  def change
    create_table :datasheet_revisions do |t|
      t.references :datasheet, null: false, foreign_key: true

      t.string  :region,  null: false      # e.g., "JP", "US", "EU"
      t.string  :locale,  null: false      # e.g., "ja", "en", "es"
      t.integer :version, null: false, default: 1
      t.text    :body                      # CKEditor5 HTML
      t.string  :source_template
      t.jsonb   :render_params, default: {}
      t.integer :status, null: false, default: 1
      t.datetime :published_at
      t.timestamps
    end

    add_index :datasheet_revisions, [ :datasheet_id, :region, :locale, :version ], unique: true
    add_index :datasheet_revisions, [ :region, :locale, :status ]
  end
end
