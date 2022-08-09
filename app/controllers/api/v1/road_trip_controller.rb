class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    mapquest = MapQuestFacade.lat_long(params[:destination])
    directions = MapQuestFacade.directions_info(params[:origin], params[:destination])
    if user.blank?
      render json: {error: "Invalid API Key, Please Try Again"}, status: 401
    elsif user
      if directions.route == false
        render json: RoadTripSerializer.impossible_route(params[:origin], params[:destination])
      else
        future_forecast = ForecastFacade.future_weather_details(mapquest.lat, mapquest.lng, directions.time)
        render json: RoadTripSerializer.new(future_forecast, directions)
      end
    end
  end
end
