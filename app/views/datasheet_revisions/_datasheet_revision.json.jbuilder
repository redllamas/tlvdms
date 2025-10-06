json.extract! datasheet_revision, :id, :datasheet_id, :region, :locale, :version, :body, :source_template, :render_params, :status, :published_at, :created_at, :updated_at
json.url datasheet_revision_url(datasheet_revision, format: :json)
