# frozen_string_literal: true

module AddCommand
  def self.exec(username, title, body)
    user = User.find_by(name: username) || User.create(name: username)
    user.diary || user.create_diary(name: "#{username}'s diary")
    user.diary.entries.create(title:, body:)
  end
end
