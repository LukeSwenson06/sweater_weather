require 'rails_helper'

describe 'forecast endpoint' do
  it "retrieves weather data" do
    User.create(email: 'therealemail@email.com', password: "12345", password_confirmation: "12345", api_key: "immanapikey" )
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

  it "responses with a status code 401 if api key was inputted wrong" do
    User.create(email: 'therealemail@email.com', password: "12345", password_confirmation: "12345", api_key: "98765" )
    params = {
      "origin": "Denver CO",
      "destination": "Pueblo, CO",
      "api_key": "immanapikey"
    }
    post '/api/v1/road_trip', params: params

    expect(response).to have_http_status(401)
    error =  JSON.parse(response.body, symbolize_names: true)
    expect(error[:error]).to eq("Invalid API Key, Please Try Again")
  end

  it "responses with a status code 401 if no api key was inputted" do
    User.create(email: 'therealemail@email.com', password: "12345", password_confirmation: "12345", api_key: "immanapikey" )
    params = {
      "origin": "Denver CO",
      "destination": "Pueblo, CO",
      "api_key": ""
    }
    post '/api/v1/road_trip', params: params
    expect(response).to have_http_status(401)
    error =  JSON.parse(response.body, symbolize_names: true)
    expect(error[:error]).to eq("Invalid API Key, Please Try Again")

  end

  it "responses with impossible route when a route can not be taken by car" do
    User.create(email: 'therealemail@email.com', password: "12345", password_confirmation: "12345", api_key: "immanapikey" )
    params = {
      "origin": "new york city, new york",
      "destination": "london, england",
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
    expect(attributes[:travel_time]).to eq "Impossible Route"
    expect(attributes).to have_key :weather_at_eta
    expect(attributes[:weather_at_eta]).to be_a Hash
    expect(attributes[:weather_at_eta]).to eq({})
  end

  it "retrieves data " do
    User.create(email: 'therealemail@email.com', password: "12345", password_confirmation: "12345", api_key: "immanapikey" )
    params = {
      "origin": "new york, ny",
      "destination": "panama",
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

    expect(attributes[:travel_time]).to_not eq("Impossible Route")

  end
end
