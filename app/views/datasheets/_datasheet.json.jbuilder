json.extract! datasheet, :id, :doc_no, :title, :status, :created_at, :updated_at
json.url datasheet_url(datasheet, format: :json)
