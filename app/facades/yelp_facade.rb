class YelpFacade
  def self.food_details(location, food)
    json = YelpService.get_food_details(location, food)
    json[:businesses].map do |data|
        Yelp.new(data)
    end
  end
end
