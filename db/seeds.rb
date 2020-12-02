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

p "Destroying Artists... #{Artist.count} "
Artist.destroy_all
p "Destroying Users... #{User.count} "
User.destroy_all
p "-----------------------"


puts ""


p "Creating users...and Admin"
5.times do
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
