require 'rails_helper'

RSpec.describe Yelp do
  it "populates MapQuest objects fields from JSON Response " do

  response = File.read('spec/fixtures/yelp.json')
  data = JSON.parse(response, symbolize_names: true)
  yelp = Yelp.new(data)

  expect(yelp.name).to eq("Fortune Wok to Table")
  expect(yelp.address).to eq("2817 E 3rd Ave, Denver, CO 80206")
  expect(yelp.address).to_not eq(["2817 E 3rd Ave", "Denver CO 80206"])
  expect(yelp.destination).to eq("Denver, CO")
  end
end
