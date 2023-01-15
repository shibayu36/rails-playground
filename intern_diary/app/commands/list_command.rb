# frozen_string_literal: true

module ListCommand
  # Returns the list of entries for the given user
  # @param username [String]
  # @return [Array<Entry>]
  def self.exec(username)
    User.find_by(name: username)&.diary&.entries&.recent_ordered
  end
end
