require 'rails_helper'

RSpec.describe "MapQuestService" do
  it "can recieve a call for location details and parse response" do
    state = "Denver,CO"

    response = MapQuestService.get_location_details(state)
    expect(response).to be_a(Hash)

    parsed_json = response[:results].first[:locations].first[:latLng]
    expect(parsed_json).to include :lat, :lng
    expect(parsed_json[:lat]).to eq(39.738453)
    expect(parsed_json[:lng]).to eq(-104.984853)
  end

  it "can recieve a call for directions details and parse response" do
    origin = "denver,co"
    destination = "pueblo,co"

    response = MapQuestService.get_directions_details(origin, destination)
    expect(response).to be_a(Hash)
    expect(response[:route]).to include :distance, :formattedTime, :locations
    expect(response[:route][:locations].first).to include :adminArea5, :adminArea1, :adminArea1
  end
end
