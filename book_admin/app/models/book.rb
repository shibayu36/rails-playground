class Book < ApplicationRecord
  belongs_to :publisher

  scope :costly, -> { where('price > ?', 3000) }
  scope :written_about, ->(theme) { where('name like ?', "%#{theme}%") }
  scope :find_price, ->(price) { find_by(price: price) }
end
