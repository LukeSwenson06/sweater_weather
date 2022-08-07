class DailyForecast
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :description,
              :icon

  def initialize(data)
    @datetime = Time.at(data[:dt]).strftime('%F'),
    @sunrise = Time.at(data[:sunrise]),
    @sunset = Time.at(data[:sunset]),
    @max_temp = data[:temp][:max],
    @min_temp = data[:temp][:min],
    @description = data[:weather].first[:description],
    @icon = data[:weather].first[:icon]
  end
end
