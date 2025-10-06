# app/models/product_datasheet.rb
class ProductDatasheet < ApplicationRecord
  belongs_to :product
  belongs_to :datasheet
  validates :product_id, uniqueness: { scope: :datasheet_id }
end
