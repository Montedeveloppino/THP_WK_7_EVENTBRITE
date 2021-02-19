# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
=begin
5.times do
  u = User.create!(email: Faker::Internet.email ,password: Faker::Internet.password, description: Faker::Movies::Hobbit.quote, fisrt_name: Faker::Name.first_name, last_name:Faker::Name.last_name)
end

5.times do
  e = Event.create!(start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) ,duration: Faker::Number.between(from: 1, to: 60), title: Faker::Movie.title, description: Faker::Quote.matz, price: Faker::Number.between(from: 10, to: 1000), location: Faker::Address.city, user: User.all)
end
=end
Event.destroy_all
#ActiveRecord::Base.connection.reset_pk_sequence!('events')
Attendance.destroy_all
#ActiveRecord::Base.connection.reset_pk_sequence!('attendances')
User.destroy_all
#ActiveRecord::Base.connection.reset_pk_sequence!('users')

5.times do
  u = User.create(fisrt_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::ChuckNorris.fact, password: '123456')
  u.email = u.fisrt_name + '_' + u.last_name + '@mail.com'
  u.save
end

5.times do
  e = Event.create(title: Faker::DcComics.title, start_date: Faker::Date.forward(days: 10), duration: [5,10,20,30].sample, description: Faker::Lorem.sentence(word_count: 15), price: Faker::Number.between(from: 1, to: 1000), location: Faker::JapaneseMedia::SwordArtOnline.location)
  e.save
end
