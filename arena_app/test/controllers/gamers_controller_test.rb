require 'test_helper'

class GamersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gamer = gamers(:michael)
    @gamer2= gamers(:archer)
  end

  test "should get index" do
    log_in_as(@gamer)  #aggiunto
    get gamers_url
    assert_response :success
  end

  test "should get new" do
    get new_gamer_url
    assert_response :success
  end



  test "should create gamer" do    #????????????? perche non crea nuovo utente?
    assert_difference('Gamer.count') do
      post gamers_path, params: { gamer: { username:  "Exaadsmple User",
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
                                         nation: "nation1"} }

    
    end


    #assert_redirected_to gamer_url(Gamer.last)
  end

  test "should show gamer" do
    get gamer_url(@gamer)
    log_in_as(@gamer)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@gamer)   #aggiunto
    get edit_gamer_url(@gamer)
    assert_response :success
  end

  test "should update gamer" do
    log_in_as(@gamer)    #aggiunto
    patch gamer_url(@gamer), params: { gamer: { username:  "Example User",
                                         email: "michael@example.com",
                                         password:              "password",
                                         password_confirmation: "password",
                                         activated: true,
                                         updated: true} }
  end

  test "should destroy gamer" do
    assert_difference('Gamer.count', -1) do
      delete gamer_url(@gamer)
      puts "000000000000000000000000000000000"+assigns(:gamer).errors.inspect
    end
  end


  test "should redirect destroy when not logged in" do
    assert_no_difference 'Gamer.count' do
      delete gamer_path(@gamer)
    end
    assert_redirected_to login_url
  end


end
