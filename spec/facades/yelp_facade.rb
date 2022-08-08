require 'rails_helper'

RSpec.describe 'YelpFacade' do

  it "makes service call and returns an array of Yelp objects" do
    food = YelpFacade.food_details("denver,co", "chinese")
    expect(food).to be_a Array
    expect(food).to_not be_a Hash
    expect(food).to be_all Yelp
  end
end
