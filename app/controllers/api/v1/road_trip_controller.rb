class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    mapquest = MapQuestFacade.lat_long(params[:destination])
    directions = MapQuestFacade.directions_info(params[:origin], params[:destination])
    future_forecast = ForecastFacade.future_weather_details(mapquest.lat, mapquest.lng, directions.time)
    if user.blank?
      render json: {error: "Invalid API Key, Please Try Again"}, status: 401
    else
      render json: RoadTripSerializer.new(future_forecast, directions)
    end
  end
end

# else
#   render json: RoadTripSerializer.impossible_route(future_forecast)
# end
