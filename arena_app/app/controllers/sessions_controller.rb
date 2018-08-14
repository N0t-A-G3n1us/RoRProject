class SessionsController < ApplicationController
  def new
  end

  def create
    gamer = Gamer.find_by(email: params[:session][:email].downcase)
    if gamer && gamer.authenticate(params[:session][:password])
      if gamer.activated?
        log_in gamer
        params[:session][:remember_me] == '1' ? remember(gamer) : forget(gamer)
        redirect_back_or gamer
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end

    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'     #da capire come si inserisce (modifica css?)
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end