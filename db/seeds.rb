User.destroy_all

u1 = User.create :name => "Cedric", :email => "cedric@gmail.com", :password => "chicken"
u2 = User.create :name => "Loui", :email => "loui@gmail.com", :password => "chicken"
u3 = User.create :name => "Tony", :email => "tony@gmail.com", :password => "chicken"
u4 = User.create :name => "Ron", :email => "ron@gmail.com", :password => "chicken", :admin => true

Item.destroy_all

i1 = Item.create :name => "That Skinny Shirt In White", :price => 36, :description => "Crisp cotton", :colour => "White", :size => "S", :brand => "ThisBrand", :category => "shirt"
i2 = Item.create :name => "That Skinny Jeans In Black", :price => 59, :description => "denim", :colour => "Black", :size => "M", :brand => "ThatBrand", :category => "pants"
i3 = Item.create :name => "That Poor Man's Weapon", :price => 40, :description => "90% Leather and other materials", :colour => "Black", :size => "41", :brand => "AllStar", :category => "shoes"


LineItem.destroy_all

l1 = LineItem.create :quantity => 0
l2 = LineItem.create :quantity => 0
l3 = LineItem.create :quantity => 0
l4 = LineItem.create :quantity => 0
l5 = LineItem.create :quantity => 0
l6 = LineItem.create :quantity => 0


Cart.destroy_all

c1 = Cart.create :total => 120
c2 = Cart.create :total => 36
c3 = Cart.create :total => 118


Order.destroy_all

o1 = Order.create :shipped => false
o2 = Order.create :shipped => false
o3 = Order.create :shipped => false
o4 = Order.create :shipped => false
o5 = Order.create :shipped => false
o6 = Order.create :shipped => false


# ASSOCIATIONS

l1.item = i3
l2.item = i1
l3.item = i2
l4.item = i4
l5.item = i5
l6.item = i6

o1.line_items << l1 << l2 << l3
o2.line_items << l4
o3.line_items << l5 << l6

u1.orders << o1
u2.orders << o2
u3.orders << o3

c1.line_items << l1
c2.line_items << l2
c3.line_items << l3

u1.cart = c1
u2.cart = c2
u3.cart = c3
