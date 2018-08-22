class ArenaPagesController < ApplicationController
  def arena


    @gamer = current_gamer
    #al momento è su overwatch: bisogna semplicemente decidere quanti stream caricare per game e recuperli da @gamer ,aggiungendo altre variabili se necessarie
    response=HTTParty.get('https://api.twitch.tv/kraken/streams/?game=Fortnite&limit=2',:headers => { 'Accept' => 'application/vnd.twitchtv.v5+json' , 'Client-ID' => 'zhlt7sm2fz1tg5z7w5rfv4zb8lybxx'})
    body=JSON.parse(response.body)
    @stream1=body["streams"][0]["channel"]["display_name"]
    @stream2=body["streams"][1]["channel"]["display_name"]
  end

  def changerole
  end

  def upgrade
	if current_gamer.casual?
	  	current_gamer.pro!
	elsif current_gamer.pro?
		current_gamer.leader!
	elsif current_gamer.leader?
		current_gamer.admin!
	end

  end


  def downgrade
	if current_gamer.admin?
	  	current_gamer.leader!
	elsif current_gamer.pro?
		current_gamer.casual!
	elsif current_gamer.leader?
		current_gamer.pro!
	end

  end




end
