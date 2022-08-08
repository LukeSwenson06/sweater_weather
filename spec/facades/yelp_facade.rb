require 'rails_helper'

RSpec.describe 'YelpFacade' do

  it "makes service call and returns an array of MapQuest objects" do
    map = YelpFacade.food_details("denver,co", "chinese")

    expect(map).to be_a Array
    expect(map).to be_all Yelp
  end
end
