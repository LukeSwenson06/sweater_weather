class Forecast
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(data)
    @current_weather = current(data[:current])
    @daily_weather = daily(data[:daily])
    @hourly_weather = hourly(data[:hourly])
  end

  def current(data)
    {
      datetime: Time.at(data[:dt]),
      sunrise: Time.at(data[:sunrise]),
      sunset: Time.at(data[:sunset]),
      temperature: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      visibility: data[:visibility],
      uvi: data[:uvi],
      conditions: data[:weather].first[:description],
      icon: data[:weather].first[:icon]
      }
  end

  def daily(data)
    data.take(5).map do |daily_forecast|
    {
      datetime: Time.at(daily_forecast[:dt]).strftime('%F'),
      sunrise: Time.at(daily_forecast[:sunrise]),
      sunset: Time.at(daily_forecast[:sunset]),
      max_temp: daily_forecast[:temp][:max],
      min_temp: daily_forecast[:temp][:min],
      description: daily_forecast[:weather].first[:description],
      icon: daily_forecast[:weather].first[:icon]
    }
    end
  end

  def hourly(data)
    data.take(8).map do |hour|
    {
      datetime: Time.at(hour[:dt]).strftime('%X'),
      temperature: hour[:temp],
      description: hour[:weather].first[:description],
      icon: hour[:weather].first[:icon]

    }
    end
  end
end
