class RoadTripSerializer
  def self.new(future_forecast, directions)

    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": directions.start_city,
          "end_city": directions.end_city,
          "travel_time": directions.time,
          "weather_at_eta":{
            "temperature": future_forecast[:temperature],
            "conditions": future_forecast[:conditions]

          }
        }
      }
    }
  end

  def self.impossible_route(origin, destination)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": origin,
          "end_city": destination,
          "travel_time": "Impossible Route",
          "weather_at_eta":{
          }
        }
      }
    }
  end
end
