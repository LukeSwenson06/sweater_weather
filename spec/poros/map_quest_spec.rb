require 'rails_helper'

RSpec.describe MapQuest do
  it "populates MapQuest objects fields from JSON Response " do

  response = File.read('spec/fixtures/map_quest.json')
  data = JSON.parse(response, symbolize_names: true)
  map = MapQuest.new(data)
  
  expect(map).to be_a MapQuest
  expect(map.lat).to eq(39.738453)
  expect(map.lng).to eq(-104.984853)
  end
end
