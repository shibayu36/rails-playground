Book.create(
  name: "enum Book 1",
  sales_status: :now_on_sale,
  publisher: Publisher.find(1),
  price: 100
)
Book.create(
  name: "enum Book 2",
  sales_status: "now_on_sale",
  publisher: Publisher.find(1),
  price: 100
)
Book.create(
  name: "enum Book 3",
  sales_status: 1,
  publisher: Publisher.find(1),
  price: 100
)
