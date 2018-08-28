require 'test_helper'

class ArenaPagesControllerTest < ActionDispatch::IntegrationTest
 setup do
    @game = games(:one)
    log_in_as(gamers(:michael))
    get upgrade_url
    get upgrade_path
    get upgrade_path
  end


end
