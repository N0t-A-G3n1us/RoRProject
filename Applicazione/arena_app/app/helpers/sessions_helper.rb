module SessionsHelper

  # Logs in the given gamer.
  def log_in(gamer)
    session[:gamer_id] = gamer.id
  end

  # Returns the current logged-in user (if any).
  def current_gamer
    @current_gamer ||= Gamer.find_by(id: session[:gamer_id])
  end

  # Returns true if the gamer is logged in, false otherwise.
  def logged_in?
    !current_gamer.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:gamer_id)
    @current_gamer = nil
  end

end
