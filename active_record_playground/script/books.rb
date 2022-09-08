# bin/rails runner script/books.rb
Book.delete_all
Book.create(name: "Hoge", price: 1000)
Book.create(name: "Fuga", price: 2000)

pp Book.pluck(:price) #=> [1000, 2000]

a1 = Book.find_price_scope(1500)
pp a1
b1 = Book.find_price_class_method(1500)
pp b1
c1 = Book.find_price_scope(1000)
pp c1
d1 = Book.dummy_constant_scope(3000).find_price_scope(1000)
pp d1
