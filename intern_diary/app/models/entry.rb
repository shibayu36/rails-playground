# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :diary

  scope :recent_ordered, -> { order(id: :desc) }

  def to_terminal_output
    <<~EOS
      [#{id}] #{title} @#{created_at.strftime('%Y-%m-%d')}
      #{body}
    EOS
  end
end
