class Api::V1::RoadTripController < ApplicationController
  def create
    mapquest = MapQuestFacade.lat_long(params[:destination])
    directions = MapQuestFacade.directions_info(params[:origin], params[:destination])
    future_forecast = ForecastFacade.future_weather_details(mapquest.lat, mapquest.lng, directions.time)
    render json: RoadTripSerializer.new(future_forecast, directions)
  end
end
