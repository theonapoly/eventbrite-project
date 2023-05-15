# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'ffaker'

User.destroy_all

puts 'Database réinitialisée..'

#Créations d'utilisateurs
5.times do 
    User.create!(
    email: Faker::Internet.email(domain: "yopmail.com"),
    encrypted_password: Faker::Internet.password,
    description: Faker::Adjective.negative,
    first_name: FFaker::NameFR.first_name,
    last_name: FFaker::NameFR.last_name
    )
end

puts 'Les utilisateurs ont bien été créé.'


# Création des événements
3.times do
    Event.create(
    start_date: Faker::Time.between_dates(from: Date.today, to: Date.today + 30),
    title: Faker::Lorem.sentence,
    location: Faker::Address.full_address,
    description: Faker::Lorem.paragraph,
    price: Faker::Number.between(from: 1, to: 1000),
    duration: rand(1..100)*5,
    administrator_id: User.all.sample.id
    )
end

puts 'Les évènements ont bien été créé.'


# Création des participations
5.times do
    Attendance.create(stripe_customer_id: Faker::Alphanumeric.alphanumeric(number: 10), attendee_id: User.all.sample.id, event_id: Event.all.sample.id)
  end

puts 'Les participations ont bien été créé.'