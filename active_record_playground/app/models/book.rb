class Book < ApplicationRecord
  scope :find_price_scope, ->(price) { find_by(price: price) }
  scope :dummy_constant_scope, ->(price) { price }

  def self.find_price_class_method(price)
    find_by(price: price)
  end
end
