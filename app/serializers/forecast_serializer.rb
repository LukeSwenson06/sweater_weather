class ForecastSerializer
  def self.new(data)
    {
      "data":{
        "id": nil,
        "type": "forecast",
        "attributes": {
          "current_weather": {
            "datetime": data[:current_weather].datetime,
            "sunrise": data[:current_weather].sunrise,
            "sunset": data[:current_weather].sunset,
            "temperature": data[:current_weather].temperature,
            "feels_like": data[:current_weather].feels_like,
            "humidity": data[:current_weather].humidity,
            "uvi": data[:current_weather].uvi,
            "visibility": data[:current_weather].visibility,
            "conditions": data[:current_weather].conditions,
            "icon": data[:current_weather].icon
          },
          "daily_weather": data[:daily_weather].map do |d|
            {
            "date": d.date.first,
            "sunrise": d.sunrise,
            "sunset": d.sunset,
            "max_temp": d.max_temp,
            "min_temp": d.min_temp,
            "conditions": d.conditions,
            "icon": d.icon
            }
          end,
          "hourly_weather": data[:hourly_weather].map do |h|
            {
            "time": h.time.first,
            "temperature": h.temperature,
            "conditions": h.conditions,
            "icon": h.icon
            }
          end
        }
      }
    }
  end
end
