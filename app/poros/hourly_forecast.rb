class HourlyForecast
  attr_reader :datetime,
              :temperature,
              :description,
              :icon
  def initialize(data)
    @datetime = Time.at(data[:dt]).strftime('%X'),
    @temperature = data[:temp],
    @description = data[:weather].first[:description],
    @icon = data[:weather].first[:icon]
  end
end
