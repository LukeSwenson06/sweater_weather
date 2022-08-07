require 'rails_helper'

describe 'forecast endpoint' do
  it "retrieves weather data" do
    get '/api/v1/forecast', params: { location: "Denver,CO" }
    expect(response).to have_http_status(200)
    json =  JSON.parse(response.body, symbolize_names: true)
    expect(json).to be_a Hash
    expect(json[:data]).to have_key :id
    expect(json[:data]).to have_key :type
    expect(json[:data]).to have_key :attributes

    forecast = json[:data][:attributes]
    expect(forecast).to have_key :current_weather
    expect(forecast[:current_weather]).to be_a Hash
    expect(forecast[:current_weather]).to have_key :datetime
    expect(forecast[:current_weather][:datetime]).to be_a String
    expect(forecast[:current_weather]).to have_key :sunrise
    expect(forecast[:current_weather][:sunrise]).to be_a String
    expect(forecast[:current_weather]).to have_key :sunset
    expect(forecast[:current_weather][:sunset]).to be_a String
    expect(forecast[:current_weather]).to have_key :temperature
    expect(forecast[:current_weather][:temperature]).to be_a Float
    expect(forecast[:current_weather]).to have_key :feels_like
    expect(forecast[:current_weather][:feels_like]).to be_a Float
    expect(forecast[:current_weather]).to have_key :humidity
    expect(forecast[:current_weather][:humidity]).to be_a Float
    expect(forecast[:current_weather]).to have_key :visibility
    expect(forecast[:current_weather][:visibility]).to be_a Integer
    expect(forecast[:current_weather]).to have_key :uvi
    expect(forecast[:current_weather][:uvi]).to be_a Float
    expect(forecast[:current_weather]).to have_key :conditions
    expect(forecast[:current_weather][:conditions]).to be_a String
    expect(forecast[:current_weather]).to have_key :icon
    expect(forecast[:current_weather][:icon]).to be_a String

    expect(forecast[:current_weather]).to_not have_key :pressure
    expect(forecast[:current_weather]).to_not have_key :dew_point
    expect(forecast[:current_weather]).to_not have_key :clouds
    expect(forecast[:current_weather]).to_not have_key :wind_speed
    expect(forecast[:current_weather]).to_not have_key :wind_gust

    expect(forecast).to have_key :daily_weather
    expect(forecast[:daily_weather]).to be_a Array

    forecast[:daily_weather].each do |daily|
      expect(daily).to have_key :date
      expect(daily[:date]).to be_a String
      expect(daily).to have_key :sunrise
      expect(daily[:sunrise]).to be_a String
      expect(daily).to have_key :sunset
      expect(daily[:sunset]).to be_a String
      expect(daily).to have_key :max_temp
      expect(daily[:max_temp]).to be_a Float
      expect(daily).to have_key :min_temp
      expect(daily[:min_temp]).to be_a Float
      expect(daily).to have_key :conditions
      expect(daily[:conditions]).to be_a String
      expect(daily).to have_key :icon
      expect(daily[:icon]).to be_a String

      expect(daily).to_not have_key :moonrise
      expect(daily).to_not have_key :moonset
      expect(daily).to_not have_key :moon_phase
      expect(daily).to_not have_key :pressure
      expect(daily).to_not have_key :dew_point
      expect(daily).to_not have_key :wind_speed
      expect(daily).to_not have_key :wind_deg
      expect(daily).to_not have_key :wind_gust
    end

    expect(forecast).to have_key :hourly_weather
    expect(forecast[:hourly_weather]).to be_a Array

    forecast[:hourly_weather].each do |hourly|
      expect(hourly).to have_key :time
      expect(hourly[:time]).to be_a String
      expect(hourly).to have_key :temperature
      expect(hourly[:temperature]).to be_a Float
      expect(hourly).to have_key :conditions
      expect(hourly[:conditions]).to be_a String
      expect(hourly).to have_key :icon
      expect(hourly[:icon]).to be_a String

      expect(hourly).to_not have_key :feels_like
      expect(hourly).to_not have_key :pressure
      expect(hourly).to_not have_key :dew_point
      expect(hourly).to_not have_key :clouds
      expect(hourly).to_not have_key :visibility
      expect(hourly).to_not have_key :wind_speed
      expect(hourly).to_not have_key :wind_deg
      expect(hourly).to_not have_key :wind_gust
    end
  end

  it "responses with a status code 400 and empty array if no location was passed in" do
    get '/api/v1/forecast'
    expect(response).to have_http_status(400)
    json =  JSON.parse(response.body, symbolize_names: true)
    expect(json[:data]).to eq([])
  end
end
