# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

Garden.destroy_all
puts "gardens destroyed"

User.destroy_all
puts "users destroyed"

User.create!(
  first_name: "Clara", 
  last_name: Faker::Name.last_name, 
  email: "clara@mail.fr", 
  password: "123456",
  password_confirmation: "123456",
  address: "44 rue Ordener, Paris"
)

User.create!(
  first_name: "Gaston", 
  last_name: Faker::Name.last_name, 
  email: "gaston@mail.fr", 
  password: "123456",
  password_confirmation: "123456",
  address: "97, rue Lénine, Bagnolet"
)

Garden.create!(
    name: "Gaston's cité fertile",
    description: "Jardin alternatif bio et collaboratif de Gaston", 
    address: "14 avenue Edouard Vaillant, Pantin", 
    user_id: User.last.id
  )

User.create!(
  first_name: "Emilie", 
  last_name: Faker::Name.last_name, 
  email: "emilie@mail.fr", 
  password: "123456",
  password_confirmation: "123456",
  address: "71 Rue Henri Langlois, Bobigny"
)

Garden.create!(
    name: "Emilie's shared garden",
    description: "Jardin alternatif bio et collaboratif de Emilie", 
    address: "4 Rue Henri Barbusse, Aubervilliers", 
    user_id: User.last.id
  )


User.create!(
  first_name: "Paul", 
  last_name: Faker::Name.last_name, 
  email: "paul@mail.fr", 
  password: "123456",
  password_confirmation: "123456",
  address: "71 Rue Henri Langlois, Bobigny"
)

Garden.create!(
    name: "Paul in Guinot garden",
    description: "Jardin alternatif bio et collaboratif de Paul", 
    address: " 4 Rue Claude Guinot, Saint-Ouen", 
    user_id: User.last.id
  )

puts "4 users created"
puts "3 gardens created"




