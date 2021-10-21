(1..5).each do |i|
  Book.create(
    name: "Book #{i}",
    published_on: Time.parse('20191224').ago(i.months),
    price: (i * 1000)
  )
end
