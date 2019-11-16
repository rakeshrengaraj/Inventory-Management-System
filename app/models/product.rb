class Product < ApplicationRecord
    has_many :product_warehouses
    has_many :warehouses, through: :product_warehouses, dependent: :destroy

    accepts_nested_attributes_for :product_warehouses

    validates_length_of :sku_code, is: 8, :message => "Character length must be 8"
    validates_uniqueness_of :sku_code
    validates :sku_code, format: { with: /\A[A-Z0-9]+\z/i, message: "Only Alphanumeric allowed" }

    default_scope { order('created_at') }
end
