book = Book.create(
  name: 'High Price Book',
  publisher: Publisher.find(1),
  price: 10_000
)
book.destroy
