class SessionsController < ApplicationController
  def new
  end

  def create
    gamer = Gamer.find_by(email: params[:session][:email].downcase)
    if gamer && gamer.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in gamer    #metodo preso da sessionhelper
      redirect_to gamer

    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'     #da capire come si inserisce (modifica css?)
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
