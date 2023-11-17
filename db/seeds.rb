# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Not good code
User.first_or_create!(email: "adminbro@email.com", 
    password: "123456", password_confirmation: "123456", 
    role: User.roles[:admin])

Room.first_or_create!(name: "General", is_private: false)