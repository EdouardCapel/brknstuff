
puts 'Cleaning database'
Request.destroy_all
User.destroy_all
Item.destroy_all

# # Creating Users
# puts 'Creating 10x Random Users / using : Faker'
# 10.times do
#   user = User.new(
#     email: Faker::Internet.email,
#     password: "password",
#     password_confirmation: "password"
#     # firstname: Faker::Name.first_name,
#     # lastname: Faker::Name.last_name,
#     # latitude: Faker::Address.latitude,
#     # longitude: Faker::Address.longitude
#   )
#   user.save!
# end

# # Creating Items
# nbr_item = 5 + rand(15)
# puts "Creating #{nbr_item}x Random Items / using : Faker "
# all_user = User.all
# nbr_item.times do
#   user = all_user.sample
#   item_name = Faker::Appliance.equipment
#   item = Item.new(
#     user: user,
#     name: item_name,
#     description: "This #{Faker::Science.element}, #{Faker::Color.color_name} #{item_name} from #{Faker::Appliance.brand}",
#     price: rand(10..1000),
#     level: rand(1..5)
#     # picture:
#   )
#   item.save!
# end

# # Creating Items
# nbr_request = 1 + rand(5)
# puts "Creating #{nbr_request}x Random Requests / using : Faker "
# all_item = Item.all
# nbr_request.times do
#   # Initialize item and user(Renter)
#   item = all_item.sample
#   renter = all_user.sample
#   # Change user(Renter) if same as item.user(Owner)
#   while renter == item.user
#     renter = all_user.sample
#   end
#   request = Request.new(
#     user: renter,
#     item: item,
#     status: rand(2),
#     start_date: Time.now,
#     end_date: Time.now + 3.day
#   )
#   request.save!
# end

# # Creating Special User
# puts 'Creating ElonMusk with BrknRocket requested by JeffBezos'
# elonmusk = User.create!(
#     email: "elonmusk@mail.com",
#     password: "password",
#     password_confirmation: "password"
#   )
# jeffbezos = User.create!(
#     email: "jeffbezos@mail.com",
#     password: "password",
#     password_confirmation: "password"
#   )
# brknrocket = Item.create!(
#     user: elonmusk,
#     name: "Broken FalconHeavy Rocket",
#     description: "Fly me to the mars, whit this silver Broken Rocket from spaceX",
#     price: 199,
#     level: 4
#   )
# Request.create!(
#     user: jeffbezos,
#     item: brknrocket,
#     status: 2,
#     start_date: Time.now,
#     end_date: Time.now + 1.day
#   )

puts 'Seed complete'
