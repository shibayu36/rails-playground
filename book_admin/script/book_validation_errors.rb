book = Book.create(
  name: '',
  price: -1
)
pp(book.errors)

book = Book.create(
  name: 'exercise hoge',
  price: 1000
)
pp(book.errors)
