require 'test_helper'

class GamersSignupTest < ActionDispatch::IntegrationTest


  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Gamer.count' do
      post gamers_path, params: { gamer: { username:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'gamers/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information with account activation" do
    get signup_path
    assert_difference 'Gamer.count', 1 do
      post gamers_path, params: { gamer:  { username:  "Exaadsmple User",
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
                                         nation: "nation1"}  }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    gamer = assigns(:gamer)
    assert_not gamer.activated?
    # Try to log in before activation.
    log_in_as(gamer)
    assert_not is_logged_in?
    # Invalid activation token
    get edit_account_activation_path("invalid token", email: gamer.email)
    assert_not is_logged_in?
    # Valid token, wrong email
    get edit_account_activation_path(gamer.activation_token, email: 'wrong')
    assert_not is_logged_in?
    # Valid activation token
    get edit_account_activation_path(gamer.activation_token, email: gamer.email)
    assert gamer.reload.activated?
    follow_redirect!
    assert is_logged_in?
  end
end
