require 'test_helper'

class ConsolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @console = consoles(:one)
    log_in_as(gamers(:michael))
    get upgrade_url
    get upgrade_path
    get upgrade_path
  end

  test "should get index" do
   
     get consoles_url
     assert_response :success
  end

  test "should get new" do
    get new_console_url
    assert_redirected_to root_url
  end

  test "should create console" do
    assert_difference('Console.count') do
      post consoles_path, params: { console: { description: "miadesc", name: "miacon" } }
      #puts "000000000000000000000000000000000"+assigns(:console).errors.inspect
    end

    assert_redirected_to console_url(Console.last)
  end

  test "should show console" do
    get console_url(@console)
    assert_response :success
  end

  test "should get edit" do
    get edit_console_url(@console)
    assert_response :success
  end

  test "should update console" do
    patch console_url(@console), params: { console: { description: @console.description, name: @console.name } }
    assert_redirected_to console_url(@console)
  end

  test "should destroy console" do
    assert_difference('Console.count', -1) do
      delete console_url(@console)
    end

    assert_redirected_to consoles_url
  end
end
