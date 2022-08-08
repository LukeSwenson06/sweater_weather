class Yelp
  attr_reader :name,
              :address,
              :destination
  def initialize(data)
    @name = data[:name]
    @address = data[:location][:display_address].join(", ")
    @destination = [data[:location][:city], data[:location][:state]].join(", ")
  end
end
