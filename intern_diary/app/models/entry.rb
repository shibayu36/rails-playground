# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :diary

  scope :recent_ordered, -> { order(id: :desc) }

  validates :title, length: { maximum: 100 }
  validates :body, length: { maximum: 60_000 }

  def to_terminal_output
    <<~TERMINAL_OUTPUT
      [#{id}] #{title} @#{created_at.strftime('%Y-%m-%d')}
      #{body}
    TERMINAL_OUTPUT
  end
end
