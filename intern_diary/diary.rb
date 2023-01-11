case ARGV[0]
in 'add'
  puts 'add command'
  puts ARGV[1..].join(' ')
in 'delete'
  puts 'delete command'
  puts ARGV[1..].join(' ')
in 'list'
  puts 'list command'
  puts ARGV[1..].join(' ')
else
  puts 'add, delete, list is required'
end
