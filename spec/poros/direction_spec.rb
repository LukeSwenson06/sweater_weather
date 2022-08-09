require 'rails_helper'

RSpec.describe Directions do
  it "populates data with Direction Attributes" do
    route = true
    response = File.read('spec/fixtures/directions.json')
    json = JSON.parse(response, symbolize_names: true)
    directions = Directions.new(json[:route], route)

    expect(directions.time).to eq("01:45:23")
    expect(directions.start_city).to eq("Denver, CO")
    expect(directions.end_city).to eq("Pueblo, CO")
    expect(directions.route).to eq(true)

  end
end
