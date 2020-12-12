# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

p " ********************************* "
p " *                               * "
p " *         BEGIN OF SEED         * "
p " *                               * "
p " ********************************* "


puts ""

p "Destroy curent data..."

puts ""

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


p "Creating users..."
10.times do
    u = User.new
    u.first_name = Faker::Name.first_name
    u.last_name = Faker::Name.last_name
    u.phone = "0102030102"
    u.email = "#{u.first_name}.#{u.last_name}@yopmail.com"
    u.password = "123456"
    u.save
    p "please wait a bit"
    tp User.last
end

p "Users creation DONE, result at bottom !"
puts ""
p "Creating admin..."
admin = User.create(first_name: "admin", last_name: "admin", email:"le.telephone.ose@gmail.com", phone:"0123456789", is_admin: true, password:"123456")
p "Users & Admin now created, #{User.count}"
p "please wait a bit"
5.times do
  sleep 1
  puts "...................."
end
puts ""


p "Creating artists..."
u = User.new
    u.first_name = "David"
    u.last_name = "LeViking"
    u.phone = "0102030102"
    u.email = "#{u.first_name}.#{u.last_name}@yopmail.com"
    u.password = "123456"
    u.save
a = Artist.new
    a.name = "David Le Viking"
    a.description = "Salut à tous ! Moi c'est David. On me surnomme David le Viking à cause de ma grosse barbe presque rousse ! Je vis actuellement à Lille.  Je suis chanteur professionnel depuis 15 ans maintenant, après 10 ans de chant en tant qu'amateur. Je suis chanteur, pianiste et guitariste pour plusieurs groupes européens (notamment français, belges et luxembourgeois). J'ai quasiment 1400 concerts à mon actif !Je me ferai un plaisir de chanter pour vous. Mon répertoire est plutôt rock / métal mais je peux aussi m'amuser à faire des reprises pop !"
    a.user_id = User.last.id
    photo = URI.open("https://res.cloudinary.com/borismd/image/upload/v1607100485/Assets/20190720-La-Guerre-du-Son-Knuckle-Head-5562_w0llzm.jpg")
    a.artist_pp.attach(io: photo, filename: 'artist_pp', content_type: 'image/jpg')
    b = User.find(a.user_id)
    b.is_artist = true
    b.save
    a.save


 u = User.new
    u.first_name = "Mathilde"
    u.last_name = "Deschamps"
    u.phone = "0102030102"
    u.email = "#{u.first_name}.#{u.last_name}@yopmail.com"
    u.password = "123456"
    u.save
a = Artist.new
    a.name = "Mathilde Deschamps"
    a.description = "Chanteuse et pianiste professionnelle, je suis aussi compositrice. Je suis spécialisée dans la musique douce, que j'accompagne de ma voix cristalline. Je suis souvent comparée à Sarah McLachlan et Amy Lee (de Evanescence). J'ai déjà fait des projets pour la radio ou la publicité. J'y travaille régulièrement depuis 5 ans maintenant. Ce sont des projets en plus de mon travail de création pour mon métier en tant qu'indépendant. J'aime chanter et vous égayer votre journée par téléphone me remplit de joie ! Mon répertoire est très vaste, allant des chansons de Disney à de l'opéra. Mais j'excelle surtout dans mes reprises de Lord, Aurora ou (étonnamment !) Britney Spears."
    a.user_id = User.last.id
    photo = URI.open("https://res.cloudinary.com/borismd/image/upload/v1607100485/Assets/piano-2585949_1280_1_ia43vh.webp")
    a.artist_pp.attach(io: photo, filename: 'artist_pp', content_type: 'image/jpg')
    b = User.find(a.user_id)
    b.is_artist = true
    b.save
    a.save


 u = User.new
    u.first_name = "Clovis"
    u.last_name = "Cantador"
    u.phone = "0102030102"
    u.email = "#{u.first_name}.#{u.last_name}@yopmail.com"
    u.password = "123456"
    u.save
a = Artist.new
    a.name = "Clovis"
    a.description = "C'est avec un nom du roi des Francs qu'ainsi m'ont appelé mes parents. Mauvais en Histoire, j'étais davantage attentif en cours de musique ! Ma passion pour le chant et la guitare a commencée dès le collège ! J'ai maintenant 26 ans et je suis chanteur professionnel depuis 5 ans, après avoir fait mes armes au conservatoire de Bordeaux. Je suis entièrement disponible pour vous, pour chanter au téléphone, avec ma voix soul et funk. Barry White est mon meilleur idole, mais tout comme Marvin Gaye et James Brown"
    a.user_id = User.last.id
    photo = URI.open("https://res.cloudinary.com/borismd/image/upload/v1607100485/Assets/35858.HR_z5ahow.jpg")
    a.artist_pp.attach(io: photo, filename: 'artist_pp', content_type: 'image/jpg')
    b = User.find(a.user_id)
    b.is_artist = true
    b.save
    a.save


 u = User.new
    u.first_name = "Jerome"
    u.last_name = "Phantom"
    u.phone = "0102030102"
    u.email = "#{u.first_name}.#{u.last_name}@yopmail.com"
    u.password = "123456"
    u.save
a = Artist.new
    a.name = "Lord Phantom"
    a.description = "Salutations, je me prénomme Jérôme et je suis chanteur d'opéra. Ténor depuis mes 22 ans dans des choeurs, j'en ai aujourd'hui 34 et j'ai entamé une carrière en tant que soliste dans plusieurs opéras en Europe. La crise du Coronavirus ayant réduit mes possibilités de déplacements et les représentations, je ne me produis désormais plus que dans ma ville natale : Paris. J'interprète les plus grands opéras du monde : du Requiem de Mozart, à Carmen de Bizet, en passant par le Barbier de Séville, de Rossini. Demandez moi n'importe quel solo et je vous le chanterai à l'autre bout du téléphone. A force de pratiquer, j'ai appris à le placer à la bonne distance pour ne pas saturer les décibels ! Note humoristique : j'ai repris l'année dernière des classiques de la chanson française comme Claude François ou Johnny Halliday en version Opéra !"
    a.user_id = User.last.id
    photo = URI.open("https://res.cloudinary.com/borismd/image/upload/v1607100485/Assets/Art-argent-4-5-ce-que-gagnent-les-solistes_yrstuj.jpg")
    a.artist_pp.attach(io: photo, filename: 'artist_pp', content_type: 'image/jpg')
    b = User.find(a.user_id)
    b.is_artist = true
    b.save
    a.save


u = User.new
    u.first_name = "Laura"
    u.last_name = "Aposta"
    u.phone = "0102030102"
    u.email = "#{u.first_name}.#{u.last_name}@yopmail.com"
    u.password = "123456"
    u.save
a = Artist.new
    a.name = "Laura Del Aposta"
    a.description = "Moi, c'est Laura ! Je suis chanteuse professionnelle depuis 8 ans au sein d'une troupe de Strasbourg. Au sein de ma famille, j'ai toujours baigné dans la vieille chanson française. Pour tout vous dire, quand j'avais 10 ans, j'ai demandé l'intégrale d'Edith Piaf !< br/>Aujourd'hui, je rends hommage ce genre musical que je chéris tant, en reprenant de vieux titres dans des festivals vintages, ou des soirées dansantes à thème. Je crois que ce que j'aime le plus, c'est chanter pour des anniversaires de retraités, à qui je souffle une mélodie chère dans leurs souvenirs. Si vous aussi, vous êtes passionné de Mireille Mathieu, Jacques Brel, Marlene Dietrich, ou encore Gilbert Bécaud, je suis celle qu'il vous faut !"
    a.user_id = User.last.id
    photo = URI.open("https://res.cloudinary.com/borismd/image/upload/v1607100485/Assets/images_ino4nz.jpg")
    a.artist_pp.attach(io: photo, filename: 'artist_pp', content_type: 'image/jpg')
    b = User.find(a.user_id)
    b.is_artist = true
    b.save
    a.save


p "Artists creation DONE, result below.... "
puts ""
tp Artist.all
puts ""


p " ********************************** "
p "                                    "
p "......now displaying all users......"
p "                                    "
p " ********************************** "
tp User.all
puts ""


p "Creating services..."
service1 = Service.create! name: "Préferée", price: 9.99,  description: "Votre chanson préférée dans le combiné"
service2 = Service.create! name: "Surprise", price: 4.99,  description: "Chanson surprise selon l'humeur"
service3 = Service.create! name: "Blague",   price: 2.99,  description: "Les meilleures blagues pourries"
p "Services creation DONE, result below.... "
puts ""
tp Service.all
puts ""


p "Creating availabilities..."
20.times do
		start_date = Faker::Time.between_dates(from: 1.days.from_now, to: 10.days.from_now, period: :day)
		start_date.change( {min: [0, 15, 30, 45].sample } )
		end_date = start_date + 15 * 60
    Availability.create! artist_id: Artist.all.sample.id, start_date: start_date, end_date: end_date, is_booked: false
    tp Availability.last
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
    av = Availability.find(o.availability_id)
    av.is_booked = true
    o.service_id = Service.all.sample.id
    o.target = "0102030102"
    o.description = Faker::Games::WorldOfWarcraft.quote
    o.status = "pendingValidate"
    av.save
    o.save
end
p "Availabilities creation DONE, result below.... "
puts ""
tp Order.all


puts ""


p " ********************************* "
p " *                               * "
p " *          END OF SEED          * "
p " *                               * "
p " ********************************* "