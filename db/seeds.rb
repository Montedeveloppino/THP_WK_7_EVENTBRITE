# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

#5.times do
 # u = User.create!(email: Faker::Internet.email(domain: 'yopmail.com') ,encrypted_password: Faker::Internet.password, description: Faker::Movies::Hobbit.quote, fisrt_name: Faker::Name.first_name, last_name:Faker::Name.last_name)
#end

5.times do
  e = Event.create!(start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) ,duration: Faker::Number.between(from: 1, to: 60), title: Faker::Movie.title, description: Faker::Quote.matz, price: Faker::Number.between(from: 10, to: 1000), location: Faker::Address.city)
end
