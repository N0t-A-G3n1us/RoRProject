
def log_in(gamer)
    session[:gamer_id] = gamer.id
  end



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
  


RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end