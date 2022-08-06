require 'rails_helper'

RSpec.describe "MapQuestService" do
  it "can recieve a call and parse response" do
    response = MapQuestService.get_location_details(state)
    expect(response).to be_a(Hash)

    parsed_json = response[:results].first[:locations].first[:latLng]
    expect(parsed_json).to include :lat, :lng
    expect(parsed_json[:lat]).to eq(39.738453)
    expect(parsed_json[:lng]).to eq(-104.984853)
  end
end
