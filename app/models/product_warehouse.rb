class ProductWarehouse < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse

  default_scope { order('created_at') }
end
