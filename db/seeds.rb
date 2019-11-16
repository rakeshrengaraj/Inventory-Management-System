# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


p "Seeding Data to the table Started"


# ======================= User Creation ==========================================================
User.create!(:email=> "admin@demo.com", :password => "password", :password_confirmation => "password")
User.create!(:email=> "manager@demo.com", :password => "password", :password_confirmation => "password")
# ======================= User Creation ==========================================================




#====================== Product Creation =======================================================
60.times do 
    Product.create!(:sku_code => Faker::Alphanumeric.alphanumeric(number: 8),:name => Faker::Appliance.unique.equipment, :price =>rand(1000..5000)) 
end   
#====================== Product Creation =======================================================




#==========================Ware House Creation ==================================================
arr = ["Mumbai", "New Delhi", "Bangalore"]
arr.each_with_index do |val,ind| 
    Warehouse.create!(:wh_code => Faker::Alphanumeric.alphanumeric(number: 8) ,:name => arr[ind],:pincode => rand(400000..500000), :max_capacity => rand(100..200)) 
end    
#==========================Ware House Creation ==================================================



#============================ Product Warehouse Creation Based on Conditions that no product is below threshold in Mumbai, a third of the products are below
#===========threshold in Bangalore and exactly half the products are below threshold in New Delhi ===============================


tlmum = Product.count    
tlbang = (Product.count/3) #Threshold level variable for Bangalore
tlnd = (Product.count/2)  #Threshold level variable for New Delhi

mintl = 10 # Minimum Threshold


Product.all.each do |p|
    Warehouse.all.each do |w|
        item_count = 0
        low_item_threshold = 0 
        
        blr_count = Warehouse.find_by(:name => "Bangalore").product_warehouses.where('item_count < low_item_threshold').count
        nd_count = Warehouse.find_by(:name => "New Delhi").product_warehouses.where('item_count < low_item_threshold').count

        if (w.name == "Mumbai")
            item_count = rand((mintl+1)..tlmum)
            low_item_threshold = rand(1..mintl)
            
        elsif (w.name == "Bangalore")
            if (blr_count < tlbang)   
                item_count = rand(1..tlbang)
                low_item_threshold = rand((tlbang+1)..tlmum)
            else  
                item_count = rand((tlbang+1)..tlmum)
                low_item_threshold = rand(1..tlbang)
            end   
            
        elsif (w.name == "New Delhi")
            if (nd_count < tlnd)
                item_count = rand(1..tlnd)
                low_item_threshold = rand((tlnd+1)..tlmum)
            else
                item_count = rand((tlnd+1)..tlmum)
                low_item_threshold = rand(1..tlnd)
            end    
            
        end
        ProductWarehouse.create!(item_count: item_count, low_item_threshold: low_item_threshold, product_id: p.id, warehouse_id: w.id)
    end    
end  
#============================ Product Warehouse Creation Based on Conditions Provided ===============================

p "Seeding Data to the table Ended"






