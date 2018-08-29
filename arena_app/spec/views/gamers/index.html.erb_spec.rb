require 'rails_helper'

RSpec.describe "gamers/index", type: :view do
  before(:each) do
    assign(:gamers, [
      Gamer.create!(),
      Gamer.create!()
    ])
  end

  it "renders a list of gamers" do
    render
  end
end
