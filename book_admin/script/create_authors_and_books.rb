matz = Author.create(name: 'Matsumoto Yukihiro', penname: 'Matz')
dhh = Author.create(name: 'David Heinemeier Hansson', penname: 'DHH')

matz.books << Book.find(1)
matz.books << Book.find(2)
puts(matz.reload.books.count)

book = Book.find(1)
book.authors << dhh
puts(book.reload.authors.pluck(:name))
