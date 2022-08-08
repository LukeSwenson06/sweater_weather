class YelpFacade
  def self.food_details(location, food)
    json = YelpService.get_food_details(location, food)
    Yelp.new(json)
  end
end
