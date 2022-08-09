class MapQuestService < BaseService
  def self.get_location_details(state)
    response = map_quest.get('geocoding/v1/address') do |faraday|
      faraday.params['key'] = ENV['map_quest_api']
      faraday.params['location'] = state
    end
    json_parse(response)
  end

  def self.get_directions_details(origin, destination)
    response = map_quest.get('/directions/v2/route') do |faraday|
      faraday.params['from'] = origin
      faraday.params['to'] = destination
      faraday.params['key'] = ENV['map_quest_api']
    end
    json_parse(response)
  end
end
