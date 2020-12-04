# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p " ********************************* "
p " *                               * "
p " *         BEGIN OF SEED         * "
p " *                               * "
p " ********************************* "

p "Destroy curent data..."

p "Destroying Orders... #{Order.count} "
Order.destroy_all
p "Destroying Availabilities... #{Availability.count} "
Availability.destroy_all
p "Destroying Services... #{Service.count} "
Service.destroy_all
p "Destroying Artists... #{Artist.count} "
Artist.destroy_all
p "Destroying Users... #{User.count} "
User.destroy_all
p "-----------------------"


puts ""


p "Creating users...and Admin"
15.times do
    u = User.new
    u.first_name = Faker::Name.first_name
    u.last_name = Faker::Name.last_name
    u.phone = Faker::PhoneNumber.phone_number
    u.email = "#{u.first_name}.#{u.last_name}@yopmail.com"
    u.password = "123456"
    u.save
end
admin = User.create(first_name: "admin", last_name: "admin", email:"eveylin.ggg@yopmail.com", phone:"0123456789", is_admin: true, password:"eltelefono")
p "Users creation DONE, result below.... "
puts ""
tp User.all


puts ""


p "Creating artists..."
5.times do
    a = Artist.new
    a.name = Faker::DcComics.hero
    a.description = Faker::Movie.quote
    a.user_id = User.all.sample.id
    a.save
end
p "Artists creation DONE, result below.... "
puts ""
tp Artist.all


puts ""


p "Creating services..."
service1 = Service.create! name: "Préferée", price: 9.99,  description: "Votre chanson préférée dans le combiné"
service2 = Service.create! name: "Surprise", price: 4.99,  description: "Chanson surprise selon l'humeur"
service3 = Service.create! name: "Blague",   price: 2.99,  description: "Les meilleures blagues pourries"
service4 = Service.create! name: "Visio",    price: 15.99, description: "BONUS VISIO (parce qu'il faut s'habiller"
p "Services creation DONE, result below.... "
puts ""
tp Service.all


puts ""


p "Creating availabilities..."
25.times do
    av = Availability.new
    av.artist_id = Artist.all.sample.id
    av.start_date = Faker::Time.between(from: 2.days.ago, to: Time.now)
    av.end_date = Faker::Time.forward(days: 5)
    av.is_booked = false
    av.save
end
p "Availabilities creation DONE, result below.... "
puts ""
tp Availability.all


puts ""


p "Creating orders..."
5.times do
    o = Order.new
    o.user_id = User.all.sample.id
    o.availability_id = Availability.all.sample.id
    o.service_id = Service.all.sample.id
    o.target = Faker::PhoneNumber.phone_number
    o.description = Faker::Games::WorldOfWarcraft.quote
    o.save
end
p "Availabilities creation DONE, result below.... "
puts ""
tp Order.all
