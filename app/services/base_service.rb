class BaseService
  def self.map_quest
    Faraday.new('http://www.mapquestapi.com')
  end
end
