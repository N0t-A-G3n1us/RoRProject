class ChatroomUsersController < ApplicationController
	before_action :set_parent
	before_action :set_chatroom
	
	

	def create
		@chatroom_user = @chatroom.chatroom_users.where(gamer_id: current_gamer.id).first_or_create
		if (@chatroom.group.nil?)
			redirect_to team_chatroom_url(@parent, @chatroom)
		else 
			redirect_to group_chatroom_url(@parent, @chatroom)
		end
	end

	def destroy
		@chatroom_user = @chatroom.chatroom_users.where(gamer_id: current_gamer.id).destroy_all
		redirect_to chatroom_path
	end

	private

		def set_parent
			if (params[:group_id].present?)
  				@parent = Group.find(params[:group_id])
  			else 
  				@parent = Team.find(params[:team_id])
  			end
			#@team = Team.find(params[:team_id])
		end


		def set_chatroom
			@chatroom = Chatroom.find(params[:chatroom_id])
		end

		

end


