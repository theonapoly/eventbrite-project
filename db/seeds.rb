# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'ffaker'

Attendance.destroy_all
Event.destroy_all
User.destroy_all

puts 'Database réinitialisée..'

#Créations d'utilisateurs
10.times do 
    User.create!(
    email: Faker::Internet.email(domain: "yopmail.com"),
    password: Faker::Internet.password,
    description: Faker::Adjective.negative,
    first_name: FFaker::NameFR.first_name,
    last_name: FFaker::NameFR.last_name
    )
end

puts 'Les utilisateurs ont bien été créé.'


# Création des événements
8.times do
    Event.create(
    image_url: Faker::LoremFlickr.image(size: "300x200", search_terms: ['music']),
    start_date: Faker::Time.between_dates(from: Date.today, to: Date.today + 50),
    title: Faker::Music.band,
    location: FFaker::AddressFR.city,
    description: FFaker::LoremFR.paragraphs,
    price: Faker::Number.between(from: 20, to: 200),
    duration: rand(30..120),
    admin_id: User.all.sample.id
    )
end

puts 'Les évènements ont bien été créé.'


# # Création des participations
# 5.times do
#     Attendance.create(stripe_customer_id: Faker::Alphanumeric.alphanumeric(number: 10), 
#     users_id: User.all.sample.id, 
#     event_id: Event.all.sample.id
#     )
#   end

# puts 'Les participations ont bien été créé.'