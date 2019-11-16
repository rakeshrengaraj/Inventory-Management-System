# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


p "Seeding Data to the table Started"

User.create!(:email=> "rakesh.rengaraj@gmail.com", :password => "password", :password_confirmation => "password")

60.times do 
   Product.create!(:sku_code => Faker::Alphanumeric.alphanumeric(number: 8),:name => Faker::Appliance.unique.equipment, :price =>rand(1000..5000)) 
end   


arr = ["New Delhi", "Mumbai", "Bangalore"]
arr.each_with_index do |val,ind| 
    Warehouse.create!(:wh_code => Faker::Alphanumeric.alphanumeric(number: 8) ,:name => arr[ind],:pincode => rand(400000..500000), :max_capacity => rand(1..10)) 
end    


Product.all.each do |p|
    Warehouse.all.each do |w|
        ProductWarehouse.create!(item_count: rand(1..30), low_item_threshold: rand(1..6), product_id: p.id, warehouse_id: w.id)
    end    
end    

p "Seeding Data to the table Ended"






