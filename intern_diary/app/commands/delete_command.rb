# frozen_string_literal: true

module DeleteCommand
  # Add an entry to specified user's diary
  # @param [String] username
  # @param [Integer] entry_id
  # @return [String, nil] error message if failed to delete an entry
  def self.exec(username, entry_id)
    user = User.find_by(name: username)
    return 'User not found' unless user

    return 'Diary not found' unless user.diary

    entry = user.diary.entries.find_by(id: entry_id)
    return 'Entry not found' unless entry

    entry.destroy
    nil
  end
end
