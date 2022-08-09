class DailyForecast
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.at(data[:dt]).strftime('%F'),
    @sunrise = Time.at(data[:sunrise]),
    @sunset = Time.at(data[:sunset]),
    @max_temp = data[:temp][:max].to_f,
    @min_temp = data[:temp][:min].to_f,
    @conditions = data[:weather].first[:description],
    @icon = data[:weather].first[:icon]
  end
end
