class Product < ApplicationRecord
  has_many :product_datasheets, dependent: :destroy
  has_many :datasheets, through: :product_datasheets
end
