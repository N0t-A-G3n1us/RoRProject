class ApplicationController < ActionController::Base
  include SessionsHelper
  include TeamsHelper
  protect_from_forgery with: :exception
  before_action :cookie_set


  def cookie_set
    @gamer = current_gamer
    return unless current_gamer
    cookies[:user_name] = @gamer.id
  end
  
  

  #def remote_ip
   # if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
   #   '123.45.67.89'
   # else
    #  request.remote_ip
   # "182.185.141.75"
   # end
  #end

  def logged_in_gamer
    unless logged_in?
      store_location
      flash[:danger]="Please log in."
      redirect_to root_url
    end
  end


  #override cancancan method
  def current_ability
    @current_ability ||= Ability.new(current_gamer)
  end

  #manage exception not authorized
  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = exception.message
    redirect_back fallback_location: root_path  end
end
