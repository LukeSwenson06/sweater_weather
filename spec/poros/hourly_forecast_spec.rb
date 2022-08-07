require 'rails_helper'

RSpec.describe HourlyForecast do
  it "populates data with DailyForecast Attributes" do
    response = File.read('spec/fixtures/forecast.json')
    json = JSON.parse(response, symbolize_names: true)
    forecast = HourlyForecast.new(json[:hourly].first)

    expect(forecast.time.first).to eq('12:00:00')
    expect(forecast.temperature).to eq(85.33)
    expect(forecast.conditions).to eq("scattered clouds")
    expect(forecast.icon).to eq("03d")

  end
end
