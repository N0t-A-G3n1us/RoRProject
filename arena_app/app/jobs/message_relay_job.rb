class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
  	ActionCable.server.broadcast "chatrooms:#{message.chatroom.id}", {
  		message: MessagesController.render(message),
    	username: message.gamer.username,
      	body: message.body,
      	chatroom_id: message.chatroom.id
	}
  end
end
