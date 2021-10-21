publisher = Publisher.create(
  name: "Gihyo inc.",
  address: "Ichigaya",
)
publisher.books << Book.create(
  name: "Book 1",
  published_on: Time.current,
  price: 1000,
)
publisher.books << Book.create(
  name: "Book 2",
  published_on: Time.current,
  price: 2000,
)
