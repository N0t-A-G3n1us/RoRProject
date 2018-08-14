class AccountActivationsController < ApplicationController


   def edit
    gamer = Gamer.find_by(email: params[:email])
    if gamer && !gamer.activated? && gamer.authenticated?(:activation, params[:id])
      gamer.activate
      log_in gamer
      flash[:success] = "Account activated!"
      redirect_to gamer
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
