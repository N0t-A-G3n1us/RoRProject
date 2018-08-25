class ChatroomUsersController < ApplicationController
	before_action :set_chatroom

	def create
		@chatroom_user = @chatroom.chatroom_users.where(gamer_id: current_gamer.id).first_or_create
		redirect_to @chatroom
	end

	def destroy
		@chatroom_user = @chatroom.chatroom_users.where(gamer_id: current_gamer.id).destroy_all
		redirect_to chatroom_path
	end

	private

		def set_chatroom
			@chatroom = Chatroom.find(params[:chatroom_id])
		end


end


