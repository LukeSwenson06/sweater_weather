class MunchieSerializer
  def self.new(yelp, forecast)
    {
      "data": {
        "id": nil,
        "type": "munchie",
        "attributes": {
          "destination_city": yelp.first.destination,
          "forecast": {
            "summary": forecast[:current_weather].conditions,
            "temperature": forecast[:current_weather].temperature,
          },
          "restaurant": {
            "name": yelp.first.name,
            "address": yelp.first.address
          }
        }
      }
    }

  end
end
