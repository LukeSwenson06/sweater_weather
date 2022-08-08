class Api::V1::MunchiesController < ApplicationController
  def index
    mapquest = MapQuestFacade.lat_long(params[:location])
    forecast = ForecastFacade.weather_details(mapquest.lat, mapquest.lng)
    yelp = YelpFacade.food_details(params[:location], params[:food])
    render json: MunchieSerializer.new(yelp, forecast)
  end
end
