class ArenaPagesController < ApplicationController
  include HTTParty
  before_action :check_attributes
  def arena
     @gamer = current_gamer
    #@gamer_games=GamersGame.select(:game_id).where(gamer_id: @gamer.id)
    @gamer_games=ActiveRecord::Base.connection.exec_query("SELECT game_id FROM gamers_games WHERE gamer_id=#{@gamer.id}")
    @gamer_games=@gamer_games.rows
    if (@gamer_games.to_a.count==3)
         (0..2).each do |i|
            @game_selected=Game.find_by(id: @gamer_games[i]).name
           response=HTTParty.get("https://api.twitch.tv/kraken/streams/?game=#{@game_selected}&limit=1&language=en",:headers => { 'Accept' => 'application/vnd.twitchtv.v5+json' , 'Client-ID' => 'zhlt7sm2fz1tg5z7w5rfv4zb8lybxx'})
            body=JSON.parse(response.body)
            if i==0
               @stream1=body["streams"][0]["channel"]["display_name"]
            else
               if i==1
                 @stream2=body["streams"][0]["channel"]["display_name"]
               else
                   @stream3=body["streams"][0]["channel"]["display_name"]
               end
           end
         end
    else
        if @gamer_games.to_a.count==1
            @game_selected=Game.find_by(id: @gamer_games).name
            response=HTTParty.get("https://api.twitch.tv/kraken/streams/?game=#{@game_selected}&limit=3&language=en",:headers => { 'Accept' => 'application/vnd.twitchtv.v5+json' , 'Client-ID' => 'zhlt7sm2fz1tg5z7w5rfv4zb8lybxx'})
            body=JSON.parse(response.body)
           @stream1=body["streams"][0]["channel"]["display_name"]
            @stream2=body["streams"][1]["channel"]["display_name"]
            @stream3=body["streams"][2]["channel"]["display_name"]
        else
            (0..1).each do |i|
                @game_selected=Game.find_by(id: @gamer_games[i]).name
                response=HTTParty.get("https://api.twitch.tv/kraken/streams/?game=#{@game_selected}&limit=2&language=en",:headers => { 'Accept' => 'application/vnd.twitchtv.v5+json' , 'Client-ID' => 'zhlt7sm2fz1tg5z7w5rfv4zb8lybxx'})
                body=JSON.parse(response.body)
                if i==1
                  @stream1=body["streams"][0]["channel"]["display_name"]
                   @stream2=body["streams"][1]["channel"]["display_name"]
                else
                   @stream3=body["streams"][0]["channel"]["display_name"]
                end
            end
        end
    end
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

  def check_attributes
       @gamer = current_gamer
       if !@gamer.updated
            flash[:danger] = "Please change your attributes#{@gamer.updated}"
            redirect_to new_account_attribute_url(email: @gamer.email)
       end
    end




end
