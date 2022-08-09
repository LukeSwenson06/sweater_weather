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
end
