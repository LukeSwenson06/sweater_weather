class MunchieSerializer
  def self.new(yelp, forecast)
    {
      "data": {
        "id": nil,
        "type": "munchie",
        "attributes": yelp.each do |y|
          {
          "destination_city": y.destination,
          "forecast": {
            "summary": forecast[:current_weather].conditions,
            "temperature": forecast[:current_weather].temperature,
          },
          "restauraunt": {
            "name": y.name,
            "address": y.address
          }
        }
      end
      }
    }

  end
end
