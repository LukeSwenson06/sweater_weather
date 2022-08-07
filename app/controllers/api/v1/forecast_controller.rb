class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location]
      mapquest = MapQuestFacade.lat_long(params[:location])
      forecast = ForecastFacade.weather_details(mapquest.lat, mapquest.lng)
      render json: ForecastSerializer.new(forecast)
    else
      render json: {data: []}, status: 400
    end
  end
end
