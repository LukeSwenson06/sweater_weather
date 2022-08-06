require 'rails_helper'

RSpec.describe "ForecastService" do
  it "can recieve a call and parse response" do
    lat = 39.7392
    lng = -104.9903

    response = ForecastService.get_weather_data(lat, lng)
    expect(response).to be_a Hash

    current = response[:current]
    expect(response).to include :current, :daily, :hourly
    expect(current).to include :sunrise, :sunset, :feels_like, :humidity, :weather
    expect(current[:sunrise]).to be_a(Integer)
    expect(current[:sunset]).to be_a(Integer)
    expect(current[:feels_like]).to be_a(Float)
    expect(current[:humidity]).to be_a(Integer)
    expect(current[:weather]).to be_a(Array)

    weather = current[:weather].first
    expect(weather).to include :description, :icon
    expect(weather[:description]).to be_a(String)
    expect(weather[:icon]).to be_a(String)

    daily = response[:daily].first
    expect(daily).to include :dt, :sunrise, :sunset, :temp, :weather

    temp = daily[:temp]
    expect(temp[:max]).to be_a(Float)
    expect(temp[:min]).to be_a(Float)

    daily_weather = daily[:weather].first
    expect(daily_weather).to include :description, :icon
    expect(daily_weather[:description]).to be_a(String)
    expect(daily_weather[:icon]).to be_a(String)

    hourly = response[:hourly]
    expect(hourly).to be_a(Array)

    hourly_data = hourly.first
    expect(hourly_data).to include :temp, :weather, :dt
    expect(hourly_data[:temp]).to be_a(Float)
    expect(hourly_data[:dt]).to be_a(Integer)
    expect(hourly_data[:weather]).to be_a(Array)

    hourly_weather = hourly_data[:weather].first
    expect(hourly_weather).to include :description, :icon
    expect(hourly_weather[:description]).to be_a(String)
    expect(hourly_weather[:icon]).to be_a(String)
  end
end
