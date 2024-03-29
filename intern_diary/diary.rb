# frozen_string_literal: true

case ARGV[0]
in 'add'
  username = ARGV[1] || abort('username is required')
  title = ARGV[2] || abort('title is required')
  body = ARGV[3] || abort('body is required')
  error = AddCommand.exec(username, title, body)
  abort(error) if error
in 'delete'
  username = ARGV[1] || abort('username is required')
  entry_id = ARGV[2] || abort('entry_id is required')
  DeleteCommand.exec(username, entry_id)
in 'list'
  username = ARGV[1] || abort('username is required')
  entries = ListCommand.exec(username)
  entries.each do |entry|
    puts entry.to_terminal_output
  end
else
  puts 'add, delete, list is required'
end
