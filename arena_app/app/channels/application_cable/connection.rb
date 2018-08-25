


module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_gamer
  
    def connect
      self.current_gamer = find_verified_gamer
      logger.add_tags "ActionCable", "User #{current_gamer.id}"
    end

    protected

      def find_verified_gamer # this checks whether a gamer is authenticated with devise
        if current_gamer = Gamer.find(cookies[:user_name])
          current_gamer
        else
          reject_unauthorized_connection
        end
      end
  end
end