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

puts "Creating games..."
if Game.count==0 #initialize games db
        response=HTTParty.get("https://api.twitch.tv/kraken/games/top",
          :headers => { 'Accept' => 'application/vnd.twitchtv.v5+json' ,
           'Client-ID' => 'zhlt7sm2fz1tg5z7w5rfv4zb8lybxx'},query:{'limit'=>100})
        parsed=JSON.parse(response.body)
        if parsed.nil?
          flash[:danger]="Error intiliazing games database. Contact Administrators"
          redirect_to root_url
        else

          parsed["top"].each do |p| 
            game=p["game"]
            Game.create(name: game["name"],logo:game["box"]["medium"] ) 
          end
        end
      end

