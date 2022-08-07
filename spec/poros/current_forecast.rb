require 'rails_helper'

RSpec.describe CurrentForecast do
  it "populates data with CurrentForecast Attributes" do
    response = File.read('spec/fixtures/forecast.json')
    json = JSON.parse(response, symbolize_names: true)
    forecast = CurrentForecast.new(json[:current])

    expect(forecast).to be_a CurrentForecast
    expect(forecast.datetime).to eq("2022-08-06 12:04:57 -0600")
    expect(forecast.sunrise).to eq("2022-08-06 06:03:39 -0600")
    expect(forecast.sunset).to eq("2022-08-06 20:08:02 -0600")
    expect(forecast.temperature).to eq(85.33)
    expect(forecast.feels_like).to eq(84.88)
    expect(forecast.humidity).to eq(41)
    expect(forecast.uvi).to eq(9.31)
    expect(forecast.visibility).to eq(10000)
    expect(forecast.description).to eq("scattered clouds")
    expect(forecast.icon).to eq("03d")

  end
end
