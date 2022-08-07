class HourlyForecast
  attr_reader :datetime,
              :temperature,
              :conditions,
              :icon
  def initialize(data)
    @datetime = Time.at(data[:dt]).strftime('%X'),
    @temperature = data[:temp],
    @conditions = data[:weather].first[:description],
    @icon = data[:weather].first[:icon]
  end
end
