require 'rails_helper'

RSpec.describe "YelpService" do
  it "can recieve a call and parse response" do
    location = "denver,co"
    food = "chinese"

    response = YelpService.get_food_details(location, food)
    expect(response).to be_a(Hash)

    business = response[:businesses].first
    expect(business).to include :name, :location
    expect(business[:name]).to eq("Fortune Wok to Table")
    expect(business[:location]).to be_a Hash
    expect(business[:location]).to include :address1, :city, :state, :zip_code
    expect(business[:location][:address1]).to eq("2817 E 3rd Ave")
    expect(business[:location][:city]).to eq("Denver")
    expect(business[:location][:state]).to eq("CO")
    expect(business[:location][:zip_code]).to eq("80206")

  end
end
