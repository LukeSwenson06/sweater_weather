class HourlyForecast
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:dt]).strftime('%X'),
    @temperature = data[:temp].to_f,
    @conditions = data[:weather].first[:description],
    @icon = data[:weather].first[:icon]
  end
end
