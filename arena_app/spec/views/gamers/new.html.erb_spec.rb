require 'rails_helper'

RSpec.describe "gamers/new", type: :view do
  before(:each) do
    assign(:gamer, Gamer.new())
  end

  it "renders new gamer form" do
    render

    assert_select "form[action=?][method=?]", gamers_path, "post" do
    end
  end
end
