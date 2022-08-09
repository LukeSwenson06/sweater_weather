class Directions
  attr_reader :time,
              :start_city,
              :end_city

  def initialize(data)
    @time = data[:formattedTime]
    @start_city = [data[:locations].first[:adminArea5], data[:locations].first[:adminArea3]].join(", ")
    @end_city = [data[:locations].second[:adminArea5], data[:locations].second[:adminArea3]].join(", ")
  end
end
