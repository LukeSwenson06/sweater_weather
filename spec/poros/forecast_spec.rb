# require 'rails_helper'
#
# RSpec.describe Forecast do
#   before :each do
#     response = File.read('spec/fixtures/forecast.json')
#     @json = JSON.parse(response, symbolize_names: true)
#     @forecast = Forecast.new(@json)
#   end
#
#   it "is a class" do
#     expect(@forecast).to be_a Forecast
#   end
#
#   it "returns a hash with keys when current weather is called" do
#     current = @forecast.current(@json[:current])
#     expect(current).to be_a Hash
#     expect(current[:datetime]).to eq("2022-08-06 12:04:57 -0600")
#     expect(current[:sunrise]).to eq("2022-08-06 06:03:39 -0600")
#     expect(current[:sunset]).to eq("2022-08-06 20:08:02 -0600")
#     expect(current[:temperature]).to eq(85.33)
#     expect(current[:feels_like]).to eq(84.88)
#     expect(current[:humidity]).to eq(41)
#     expect(current[:uvi]).to eq(9.31)
#     expect(current[:visibility]).to eq(10000)
#
#     current_weather = @json[:current][:weather].first
#     expect(current_weather[:description]).to eq("scattered clouds")
#     expect(current_weather[:icon]).to eq("03d")
#
#   end
#
#   it "returns a hash with keys when daily weather is called" do
#     daily = @forecast.daily(@json[:daily])
#     expect(daily).to be_a Array
#     expect(daily.count).to eq(5)
#
#     one_daily = daily.first
#     expect(one_daily[:datetime]).to eq('2022-08-06')
#     expect(one_daily[:sunrise]).to eq('2022-08-06 06:03:39 -0600')
#     expect(one_daily[:sunset]).to eq('2022-08-06 20:08:02 -0600')
#     expect(one_daily[:max_temp]).to eq(89.89)
#     expect(one_daily[:min_temp]).to eq(73)
#     expect(one_daily[:description]).to eq("light rain")
#     expect(one_daily[:icon]).to eq("10d")
#
#   end
#
#   it "returns a hash with keys when hourly weather is called" do
#     hourly = @forecast.hourly(@json[:hourly])
#
#     expect(hourly).to be_a Array
#     expect(hourly.count).to eq(8)
#
#     one_hour = hourly.first
#     expect(one_hour[:datetime]).to eq('12:00:00')
#     expect(one_hour[:temperature]).to eq(85.33)
#     expect(one_hour[:description]).to eq("scattered clouds")
#     expect(one_hour[:icon]).to eq("03d")
#   end
# end
