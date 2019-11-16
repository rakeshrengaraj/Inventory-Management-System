class Warehouse < ApplicationRecord
    has_many :product_warehouses
    has_many :products, through: :product_warehouses, dependent: :destroy

    accepts_nested_attributes_for :products

    validates_length_of :wh_code, :within => 4..16, :too_long => "Code must be Shorter than 16", :too_short => "Code must be longer than 4"
    validates_uniqueness_of :wh_code
    validates :wh_code, format: { with: /\A[A-Z0-9]+\z/i, message: "Only Alphanumeric allowed" }

    validates_presence_of :name

    default_scope { order('created_at') }

end
