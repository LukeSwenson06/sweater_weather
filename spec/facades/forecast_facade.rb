require 'rails_helper'

RSpec.describe "ForecastFacade" do
  it "make a service call and return objects" do
    forecast = ForecastFacade.weather_details(39.7392, -104.9903)

    expect(forecast[:current_weather]).to be_a(CurrentForecast)
    expect(forecast[:daily_weather]).to be_all(DailyForecast)
    expect(forecast[:daily_weather].count).to eq(5)
    expect(forecast[:hourly_weather]).to be_all(HourlyForecast)
    expect(forecast[:hourly_weather].count).to eq(8)

  end

  it "make a service call and return FutureForecast objects" do
    response = File.read("spec/fixtures/future_forecast.json")
    json = JSON.parse(response, symbolize_names: true)
    forecast = ForecastFacade.future_weather_details(json[:lat], json[:lon],"01:45:23")

    expect(forecast[:conditions]).to eq("clear sky")
    expect(forecast[:temperature]).to eq(77.16)
    expect(forecast[:conditions]).to_not eq("few clouds")
  end

  it "can convert time to single integer" do
    travel_time = "01:45:23"

    expect(ForecastFacade.time_convert(travel_time)).to eq(1)
    expect(ForecastFacade.time_convert(travel_time)).to_not eq(travel_time)
  end
end
