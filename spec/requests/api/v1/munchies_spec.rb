require 'rails_helper'

describe 'munchies endpoint' do
  it "retrieves food data and weather" do
    get '/api/v1/munchies', params: { location: "Denver,CO", food: "chinese" }
    expect(response).to have_http_status(200)
    json =  JSON.parse(response.body, symbolize_names: true)
    expect(json).to be_a Hash
    expect(json[:data]).to have_key :id
    expect(json[:data]).to have_key :type
    expect(json[:data]).to have_key :attributes

    attributes = json[:data][:attributes]
    expect(attributes).to be_a Hash
    expect(attributes).to have_key :destination_city
    expect(attributes).to have_key :forecast
    expect(attributes[:forecast]).to be_a Hash
    expect(attributes[:forecast]).to have_key :summary
    expect(attributes[:forecast][:summary]).to be_a String
    expect(attributes[:forecast]).to have_key :temperature
    expect(attributes[:forecast][:temperature]).to be_a Float
    expect(attributes[:forecast]).to_not have_key :datetime
    expect(attributes[:forecast]).to_not have_key :sunrise
    expect(attributes[:forecast]).to_not have_key :sunset
    expect(attributes[:forecast]).to_not have_key :feels_like
    expect(attributes[:forecast]).to_not have_key :humidity
    expect(attributes[:forecast]).to_not have_key :uvi
    expect(attributes[:forecast]).to_not have_key :icon

    expect(attributes).to have_key :restaurant
    expect(attributes[:restaurant]).to have_key :name
    expect(attributes[:restaurant][:name]).to be_a String
    expect(attributes[:restaurant]).to have_key :address
    expect(attributes[:restaurant][:address]).to be_a String

    expect(attributes[:restaurant]).to_not have_key :rating
    expect(attributes[:restaurant]).to_not have_key :review_count
    expect(attributes[:restaurant]).to_not have_key :coordinates
    expect(attributes[:restaurant]).to_not have_key :price
    expect(attributes[:restaurant]).to_not have_key :phone

  end
end
