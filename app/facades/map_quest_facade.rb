class MapQuestFacade
  def self.lat_long(state)
    json = MapQuestService.get_location_details(state)
    MapQuest.new(json)
  end

  def self.directions_info(origin, destination)
    json = MapQuestService.get_directions_details(origin, destination)[:route]
    Directions.new(json)
  end
end
