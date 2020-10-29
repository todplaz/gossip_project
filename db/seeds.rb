# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.locale = :fr

City.destroy_all
Tag.destroy_all
User.destroy_all
Gossip.destroy_all
PrivateMessage.destroy_all

10.times do 
    city_list = City.create(name: Faker::Nation.capital_city, zip_code: Faker::Address.zip_code)
end

puts "10 villes à inscrire"

tp City.all

10.times do 
    tag_list = Tag.create(title:"#"+Faker::Hipster.word)
end

puts "10 tags créés"

tp Tag.all

# 30.times do
#     user_list = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Movies::StarWars.quote, email: Faker::Internet.email, age: rand(10..99), city: City.all.sample)
# end

# puts "20 user créés"

# tp User.all

# 10.times do
#     gossip_list = Gossip.create(title: Faker::Hipster.word, content: Faker::ChuckNorris.fact, user: User.all.sample, tag: Tag.all.sample)
# end

# puts "30 gossips"

# tp Gossip.all

# 10.times do
#     pm_list = PrivateMessage.create(recipient: User.all.sample, sender: User.all.sample, content: Faker::Hipster.paragraph(sentence_count: 4))
# end

# puts "3 messages privés"

# tp PrivateMessage.all