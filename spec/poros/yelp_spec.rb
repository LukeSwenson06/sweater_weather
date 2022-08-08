require 'rails_helper'

RSpec.describe Yelp do
  it "populates MapQuest objects fields from JSON Response " do

  response = File.read('spec/fixtures/yelp.json')
  data = JSON.parse(response, symbolize_names: true)
  yelp = Yelp.new(data)

  expect(yelp).to be_a MapQuest
  expect(yelp.name).to eq("Fortune Wok to Table")
  expect(yelp.addresss).to eq("2817 E 3rd Ave, Denver, CO 80206")
  end
end
