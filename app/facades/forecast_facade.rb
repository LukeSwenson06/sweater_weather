class ForecastFacade
  def self.weather_details(lat, long)
  json =  ForecastService.get_weather_data(lat, long)
    current_weather = CurrentForecast.new(json[:current])

    daily_weather = json[:daily].take(5).map do |data|
      DailyForecast.new(data)
    end

    hourly_weather = json[:hourly].take(8).map do |data|
      HourlyForecast.new(data)
    end

    { current_weather: current_weather, daily_weather: daily_weather, hourly_weather: hourly_weather}
    binding.pry
  end
end
