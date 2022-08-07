require 'rails_helper'

RSpec.describe DailyForecast do
  it "populates data with DailyForecast Attributes" do
    response = File.read('spec/fixtures/forecast.json')
    json = JSON.parse(response, symbolize_names: true)
    forecast = DailyForecast.new(json[:daily].first)
    expect(forecast.datetime).to eq('2022-08-06')
    expect(forecast.sunrise).to eq('2022-08-06 06:03:39 -0600')
    expect(forecast.sunset).to eq('2022-08-06 20:08:02 -0600')
    expect(forecast.max_temp).to eq(89.89)
    expect(forecast.min_temp).to eq(73)
    expect(forecast.description).to eq("light rain")
    expect(forecast.icon).to eq("10d")

  end
end
