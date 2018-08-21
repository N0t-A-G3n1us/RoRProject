class ApplicationController < ActionController::Base
  include SessionsHelper
  include TeamsHelper
  protect_from_forgery with: :exception


  #def remote_ip
   # if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
   #   '123.45.67.89'
   # else
    #  request.remote_ip
   # "182.185.141.75"
   # end
  #end

  def current_utent
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

end
