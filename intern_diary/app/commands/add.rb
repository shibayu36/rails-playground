# frozen_string_literal: true

module Commands
  module Add
    def self.exec(username, _title, _body)
      user = User.find_by_username(username) || User.create(username:)
    end
  end
end
