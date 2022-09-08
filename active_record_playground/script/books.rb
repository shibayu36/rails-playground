pp Book.pluck(:price) #=> [1000, 2000]

a1 = Book.find_price_scope(1500)
b1 = Book.find_price_class_method(1500)
c1 = Book.find_price_scope(1000)
d1 = Book.dummy_constant_scope(3000).find_price_scope(1000)

pp a1
pp b1
pp c1
pp d1
