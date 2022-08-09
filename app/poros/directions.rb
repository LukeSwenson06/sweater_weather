class Directions
  attr_reader :time,
              :start_city,
              :end_city,
              :route

  def initialize(data, route)
    if route == true
      @time = data[:formattedTime]
      @start_city = [data[:locations].first[:adminArea5], data[:locations].first[:adminArea3]].join(", ")
      @end_city = [data[:locations].second[:adminArea5], data[:locations].second[:adminArea3]].join(", ")
      @route = true
    else
      @time = nil
      @start_city = nil
      @end_city = nil
      @route = false
    end
  end
end
