# frozen_string_literal: true

class Diary < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
end
