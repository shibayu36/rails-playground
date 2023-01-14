# frozen_string_literal: true

case ARGV[0]
in 'add'
  username = ARGV[1] || abort('username is required')
  title = ARGV[2] || abort('title is required')
  body = ARGV[3] || abort('body is required')
  AddCommand.exec(username, title, body)
in 'delete'
  puts 'delete command'
  puts ARGV[1..].join(' ')
in 'list'
  puts 'list command'
  puts ARGV[1..].join(' ')
else
  puts 'add, delete, list is required'
end
