require 'rails_helper'

RSpec.describe "gamers/edit", type: :view do
  before(:each) do
    @gamer = assign(:gamer, Gamer.create!())
  end

  it "renders the edit gamer form" do
    render

    assert_select "form[action=?][method=?]", gamer_path(@gamer), "post" do
    end
  end
end
