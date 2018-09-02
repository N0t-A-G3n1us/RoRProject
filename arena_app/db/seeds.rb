# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#aggiunto PRIMA ERA VUOTO

# Gamer.create!(username:  "Example Gamer",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              activated: true,
#              activated_at: Time.zone.now)

# 99.times do |n|
#   username  = Faker::Name.name
#   email = "example-#{n+1}@railstutoriall.org"
#   password = "password"
#   Gamer.create!(username:  username,
#               email: email,
#               password:              password,
#               password_confirmation: password,
#               activated: true,
#               activated_at: Time.zone.now)
# end

require 'csv'
puts "Importing nations..."

if Nation.count==0
	CSV.foreach(Rails.root.join("region_code.csv"), headers: true) do |row|
		Nation.create! do |n|
		n.name = row[0]
		n.code = row[1]
	end
	end
end
puts "Creating consoles..."
if Console.count==0  
  Console.create(name:'PS4')
  Console.create(name:'XBOX ONE')
  Console.create(name:'PC')
  Console.create(name:'Mobile')
end




