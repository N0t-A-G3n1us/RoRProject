module Helpers
	
  def current_gamer

    if (gamer_id = session[:gamer_id])
      @current_gamer ||= Gamer.find_by(id: gamer_id)
    elsif (gamer_id = cookies.signed[:gamer_id])
      gamer = Gamer.find_by(id: gamer_id)
      if gamer && gamer.authenticated?(:remember,cookies[:remember_token])
        log_in gamer
        @current_gamer = gamer
      end
    end
  end
  def log_in(gamer)
    session[:gamer_id] = gamer.id
  end
  def is_logged_in?
    !session[:gamer_id].nil?
  end

  # Log in as a particular user.
  def log_in_as(gamer)
  	session[:gamer_id] = gamer.id
  end



  def complete_log_in
    @user=Gamer.create(username:  "Exaadsmple User",
     email: "michfael@example.com",
     password:              "password",
     password_confirmation: "password",
     activated: true,
     updated: true,
     team_id: 1,
     group_id: 1,
     role: 1,
     description: "username1",
     nickname: "nickname1",
     nation: "nation1")
    log_in_as(@user)
    get upgrade_url
    get upgrade_path
    get upgrade_path
  end


end