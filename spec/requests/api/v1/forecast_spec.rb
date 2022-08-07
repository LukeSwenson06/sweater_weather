require 'rails_helper'

describe 'forecast endpoint' do
  it "retrieves weather data" do
    get '/api/v1/forecast', params: { location: "Denver,CO" }
    expect(response).to have_https_status(200)
    forecast =  JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to be_a Hash
    expect(forecast).to have_keys :id, :type, :attributes
    expect(forecast[:attributes]).to have_key :current_weather
    expect(forecast[:attributes][:current_weather]).to_be a Hash
    expect(forecast[:attributes][:current_weather]).to have_key :datetime
    expect(forecast[:attributes][:current_weather][:datetime]).to be_a String
    expect(forecast[:attributes][:current_weather]).to have_key :sunrise
    expect(forecast[:attributes][:current_weather][:sunrise]).to be_a String
    expect(forecast[:attributes][:current_weather]).to have_key :sunset
    expect(forecast[:attributes][:current_weather][:sunset]).to be_a String
    expect(forecast[:attributes][:current_weather]).to have_key :temperature
    expect(forecast[:attributes][:current_weather][:temperature]).to be_a Float
    expect(forecast[:attributes][:current_weather]).to have_key :feels_like
    expect(forecast[:attributes][:current_weather][:feels_like]).to be_a Float
    expect(forecast[:attributes][:current_weather]).to have_key :humidity
    expect(forecast[:attributes][:current_weather][:humidity]).to be_a Float
    expect(forecast[:attributes][:current_weather]).to have_key :visibility
    expect(forecast[:attributes][:current_weather][:visibility]).to be_a Float
    expect(forecast[:attributes][:current_weather]).to have_key :uvi
    expect(forecast[:attributes][:current_weather][:uvi]).to be_a Float
    expect(forecast[:attributes][:current_weather]).to have_key :conditions
    expect(forecast[:attributes][:current_weather][:conditions]).to be_a String
    expect(forecast[:attributes][:current_weather]).to have_key :icon
    expect(forecast[:attributes][:current_weather][:icon]).to be_a String

    expect(forecast[:attributes][:current_weather]).to_not have_key :pressure
    expect(forecast[:attributes][:current_weather]).to_not have_key :dew_point
    expect(forecast[:attributes][:current_weather]).to_not have_key :clouds
    expect(forecast[:attributes][:current_weather]).to_not have_key :wind_speed
    expect(forecast[:attributes][:current_weather]).to_not have_key :wind_gust

    expect(forecast[:attributes]).to have_key :daily_weather
    expect(forecast[:attributes][:daily_weather]).to_be a Hash
    expect(forecast[:attributes][:daily_weather]).to have_key :date
    expect(forecast[:attributes][:daily_weather][:date]).to be_a String
    expect(forecast[:attributes][:daily_weather]).to have_key :sunrise
    expect(forecast[:attributes][:daily_weather][:sunrise]).to be_a String
    expect(forecast[:attributes][:daily_weather]).to have_key :sunset
    expect(forecast[:attributes][:daily_weather][:sunset]).to be_a String
    expect(forecast[:attributes][:daily_weather]).to have_key :max_temp
    expect(forecast[:attributes][:daily_weather][:max_temp]).to be_a Float
    expect(forecast[:attributes][:daily_weather]).to have_key :min_temp
    expect(forecast[:attributes][:daily_weather][:min_temp]).to be_a Float
    expect(forecast[:attributes][:daily_weather]).to have_key :conditions
    expect(forecast[:attributes][:daily_weather][:conditions]).to be_a String
    expect(forecast[:attributes][:daily_weather]).to have_key :icon
    expect(forecast[:attributes][:daily_weather][:icon]).to be_a String

    expect(forecast[:attributes][:daily_weather]).to_not have_key :moonrise
    expect(forecast[:attributes][:daily_weather]).to_not have_key :moonset
    expect(forecast[:attributes][:daily_weather]).to_not have_key :moon_phase
    expect(forecast[:attributes][:daily_weather]).to_not have_key :pressure
    expect(forecast[:attributes][:daily_weather]).to_not have_key :dew_point
    expect(forecast[:attributes][:daily_weather]).to_not have_key :wind_speed
    expect(forecast[:attributes][:daily_weather]).to_not have_key :wind_deg
    expect(forecast[:attributes][:daily_weather]).to_not have_key :wind_gust

    expect(forecast[:attributes]).to have_key :hourly_weather
    expect(forecast[:attributes][:hourly_weather]).to_be a Hash
    expect(forecast[:attributes][:hourly_weather]).to have_key :date
    expect(forecast[:attributes][:hourly_weather][:date]).to be_a String
    expect(forecast[:attributes][:hourly_weather]).to have_key :temperature
    expect(forecast[:attributes][:hourly_weather][:temperature]).to be_a Float
    expect(forecast[:attributes][:hourly_weather]).to have_key :conditions
    expect(forecast[:attributes][:hourly_weather][:conditions]).to be_a String
    expect(forecast[:attributes][:hourly_weather]).to have_key :icon
    expect(forecast[:attributes][:hourly_weather][:icon]).to be_a String

    expect(forecast[:attributes][:hourly_weather]).to_not have_key :feels_like
    expect(forecast[:attributes][:hourly_weather]).to_not have_key :pressure
    expect(forecast[:attributes][:hourly_weather]).to_not have_key :dew_point
    expect(forecast[:attributes][:hourly_weather]).to_not have_key :clouds
    expect(forecast[:attributes][:hourly_weather]).to_not have_key :visibility
    expect(forecast[:attributes][:hourly_weather]).to_not have_key :wind_speed
    expect(forecast[:attributes][:hourly_weather]).to_not have_key :wind_deg
    expect(forecast[:attributes][:hourly_weather]).to_not have_key :wind_gust

  end
end
