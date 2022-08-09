class MapQuestFacade
  def self.lat_long(state)
    json = MapQuestService.get_location_details(state)
    MapQuest.new(json)
  end

  def self.directions_info(origin, destination)
    true_route = true
    false_route = false
    json = MapQuestService.get_directions_details(origin, destination)[:route]
    if json[:routeError][:errorCode] == 2
      Directions.new(json, false_route)
    else
      Directions.new(json, true_route)
    end
  end
end
