require 'rails_helper'

RSpec.describe Forecast do
  before :each do
    response = File.read('spec/fixtures/forecast.json')
    @json = JSON.parse(response, symbolize_names: true)
    @forecast = Forecast.new(@json)
  end

  it "is a class" do
    expect(@forecast).to be_a Forecast
  end

  it "returns a hash with keys when current weather is called" do
    current = @forecast.current(@json[:current])
    expect(current).to be_a Hash
    expect(current[:datetime]).to eq("2022-08-06 12:04:57 -0600")
    expect(current[:sunrise]).to eq("2022-08-06 06:03:39 -0600")
    expect(current[:sunset]).to eq("2022-08-06 20:08:02 -0600")
    expect(current[:temperature]).to eq(85.33)
    expect(current[:feels_like]).to eq(84.88)
    expect(current[:humidity]).to eq(41)
    expect(current[:uvi]).to eq(9.31)
    expect(current[:visibility]).to eq(10000)

    current_weather = @json[:current][:weather].first
    expect(current_weather[:description]).to eq("scattered clouds")
    expect(current_weather[:icon]).to eq("03d")

  end

  it "returns a hash with keys when daily weather is called" do
    daily = @forecast.daily(@json[:daily])

    expect(daily).to be_a Array
    expect(daily.count).to eq(5)
    daily = @forecast.first
    
    expect(daily[:date])
  end
end
