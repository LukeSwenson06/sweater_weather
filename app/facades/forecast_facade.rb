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
  end

  def self.future_weather_details(future_lat, future_lng, travel_time)
    json = ForecastService.get_weather_data(future_lat, future_lng)
    hourly_weather = json[:hourly].map do |data|
      HourlyForecast.new(data)
    end
      timeconversion = time_convert(travel_time)
     future_hourly_forecast = hourly_weather[timeconversion]
     { conditions: future_hourly_forecast.conditions, temperature: future_hourly_forecast.temperature }
  end

  def self.time_convert(travel_time)
    travel_time.split(':').first.to_i
  end
end
