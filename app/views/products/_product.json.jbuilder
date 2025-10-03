json.extract! product, :id, :name, :description, :category, :body_material, :applicable_fluids, :pmo, :tmo, :pma, :tma, :extras, :status, :created_at, :updated_at
json.url product_url(product, format: :json)
