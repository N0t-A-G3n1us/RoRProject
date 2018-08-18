class ApplicationController < ActionController::Base
  include SessionsHelper
  include TeamsHelper
  protect_from_forgery with: :exception
  

end
