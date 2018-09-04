class ArenaPagesController < ApplicationController
  include  ArenaPagesHelper
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
         elsif @gamer_games.to_a.count==2
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
    elsif @gamer_games.to_a.count==1

            @game_selected=Game.find_by(id: @gamer_games).name
            response=HTTParty.get("https://api.twitch.tv/kraken/streams/?game=#{@game_selected}&limit=3&language=en",:headers => { 'Accept' => 'application/vnd.twitchtv.v5+json' , 'Client-ID' => 'zhlt7sm2fz1tg5z7w5rfv4zb8lybxx'})
            body=JSON.parse(response.body)

           @stream1=check_video_json(body,0)
            @stream2=check_video_json(body,1)
            @stream3=check_video_json(body,2)

      else #no games for player
          #rimanda a setting
          flash[:danger]="You have not selected any game!"
          redirect_to edit_account_attribute_url(id:current_gamer.id,email: current_gamer.email)

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




end
