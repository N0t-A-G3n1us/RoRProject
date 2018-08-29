require("rails_helper")
require "helpers"

RSpec.describe "console controller", :type => :request do
  fixtures :consoles
  fixtures :gamers
  
  before do
    @console = consoles(:one)
  #  complete_log_in
   allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil } 
  end
  it("should get index") do
    get(consoles_url)
    assert_response(:success)
  end
  it("should get new") do
    get(new_console_url)
    assert_response(:success)
  end
  it("should create console") do
    expect do
      post(consoles_path, :params => ({ :console => ({ :description => "miadesc", :name => "miacon" }) }))
    end.to(change { Console.count })
    assert_redirected_to(console_url(Console.last))
  end
  it("should show console") do
    get(console_url(@console))
    assert_response(:success)
  end
  it("should get edit") do
    get(edit_console_url(@console))
    assert_response(:success)
  end
  it("should update console") do
    patch(console_url(@console), :params => ({ :console => ({ :description => @console.description, :name => @console.name }) }))
    assert_redirected_to(console_url(@console))
  end
  it("should destroy console") do
    expect { delete(console_url(@console)) }.to(change { Console.count }.by(-1))
    assert_redirected_to(consoles_url)
  end
end
