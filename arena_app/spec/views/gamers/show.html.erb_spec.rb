require 'rails_helper'

RSpec.describe "gamers/show", type: :view do
  before(:each) do
    @gamer = assign(:gamer, Gamer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
