# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :diary

  scope :recent_ordered, -> { order(id: :desc) }
end
