require 'rails_helper'

describe 'forecast endpoint' do
  it "retrieves weather data" do
    params = {
      "origin": "Denver CO",
      "destination": "Pueblo, CO",
      "api_key": "immanapikey"
    }
    post '/api/v1/road_trip', params: params
    expect(response).to have_http_status(200)
    json =  JSON.parse(response.body, symbolize_names: true)
    expect(json).to be_a Hash
    expect(json[:data]).to have_key :id
    expect(json[:data]).to have_key :type
    expect(json[:data]).to have_key :attributes

    attributes = json[:data][:attributes]
    expect(attributes).to have_key :start_city
    expect(attributes[:start_city]).to be_a String
    expect(attributes).to have_key :end_city
    expect(attributes[:end_city]).to be_a String
    expect(attributes).to have_key :travel_time
    expect(attributes[:travel_time]).to be_a String
    expect(attributes).to have_key :weather_at_eta
    expect(attributes[:weather_at_eta]).to have_key :temperature
    expect(attributes[:weather_at_eta][:temperature]).to be_a Float
    expect(attributes[:weather_at_eta]).to have_key :conditions
    expect(attributes[:weather_at_eta][:conditions]).to be_a String

  end

  it "responses with a status code 400 if api key was inputted wrong" do
    User.create(email: 'therealemail@email.com', password: "12345", password_confirmation: "12345", api_key: "98765" )
    params = {
      "origin": "Denver CO",
      "destination": "Pueblo, CO",
      "api_key": "immanapikey"
    }
    post '/api/v1/road_trip', params: params

    expect(response).to have_http_status(400)
    error =  JSON.parse(response.body, symbolize_names: true)
    expect(error[:error]).to eq("Invalid API Key, Please Try Again")
  end
end
