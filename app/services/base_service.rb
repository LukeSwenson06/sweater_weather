class BaseService
  def self.map_quest
    Faraday.new('http://www.mapquestapi.com')
  end

  def self.open_weather
    Faraday.new("https://api.openweathermap.org")
  end

  def self.json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
