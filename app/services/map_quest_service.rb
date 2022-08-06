class MapQuestService < BaseService
  def self.get_location_details(state)
    response = map_quest.get('geocoding/v1/address') do |faraday|
      faraday.params['key'] = ENV['map_quest_api']
      faraday.params['location'] = state
    end
    json_parse(response)
  end
end
