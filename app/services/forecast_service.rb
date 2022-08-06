class ForecastService < BaseService
  def self.get_weather_data(lat, lng)
    response = open_weather.get('/data/2.5/onecall') do |faraday|
      faraday.params['lat'] = lat
      faraday.params['lon'] = lng
      faraday.params['appid'] = ENV['open_weather_api']
      faraday.params['units'] = 'imperial'
    end
    json_parse(response)
  end
end
