# frozen_string_literal: true

module AddCommand
  # Add an entry to specified user's diary
  # @param [String] username
  # @param [String] title
  # @param [String] body
  # @return [String, nil] error message if failed to add an entry
  def self.exec(username, title, body)
    user = User.find_by(name: username) || User.create(name: username)
    return user.errors.full_messages.first if user.errors.present?

    user.diary || user.create_diary(name: "#{username}'s diary")

    entry = user.diary.entries.create(title:, body:)
    return entry.errors.full_messages.first if entry.errors.present?

    nil
  end
end
