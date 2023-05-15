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