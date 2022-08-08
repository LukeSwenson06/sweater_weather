class YelpService < BaseService
  def self.get_food_details(location, food)
    response = yelp.get("/v3/businesses/search") do |faraday|
      faraday.headers['authorization'] = ENV['yelp_api_key']
      faraday.params['location'] = location
      faraday.params['categories'] = food
    end
    json_parse(response)
  end
end
