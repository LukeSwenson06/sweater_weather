class CurrentForecast
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :visibility,
              :uvi,
              :conditions,
              :icon
  def initialize(data)
    @datetime = Time.at(data[:dt])
    @sunrise = Time.at(data[:sunrise])
    @sunset = Time.at(data[:sunset])
    @temperature = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @visibility = data[:visibility]
    @uvi = data[:uvi]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end
