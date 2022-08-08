require 'rails_helper'

RSpec.describe "YelpService" do
  it "can recieve a call and parse response" do
    location = "denver,co"
    food = "chinese"

    response = YelpService.get_food_details(location, food)
    expect(response).to be_a(Hash)

    parsed_json = response[:businesses].first
    expect(parsed_json).to include :name, :location
    expect(parsed_json[:name]).to eq("Fortune Wok to Table")
    expect(parsed_json[:location]).to be_a Hash
    expect(parsed_json[:location]).to include :address1, :city, :state, :zip_code
    expect(parsed_json[:location][:address1]).to eq("2817 E 3rd Ave")
    expect(parsed_json[:location][:city]).to eq("Denver")
    expect(parsed_json[:location][:state]).to eq("CO")
    expect(parsed_json[:location][:zip_code]).to eq("80206")

  end
end
