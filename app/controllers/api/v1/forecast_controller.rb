class Api::V1::ForecastController < ApplicationController
  def index
    mapquest = MapQuestFacade.lat_long(params[:location])
    forecast = ForecastFacade.weather_details()
  end
end
