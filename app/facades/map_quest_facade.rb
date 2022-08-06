class MapQuestFacade
  def self.lat_long(state)
    MapQuestService.get_location_details(state)
  end
end
