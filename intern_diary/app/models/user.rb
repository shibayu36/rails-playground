# frozen_string_literal: true

class User < ApplicationRecord
  has_one :diary, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }

  def recent_entries
    diary&.entries&.recent_ordered || []
  end
end
