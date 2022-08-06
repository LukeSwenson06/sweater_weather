class MapQuestFacade
  def self.lat_long(state)
    json = MapQuestService.get_location_details(state)
    MapQuest.new(json)
  end
end
