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
end
