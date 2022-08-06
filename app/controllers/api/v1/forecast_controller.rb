class Api::V1::ForecastController < ApplicationController
  def index
    mapquest = MapQuestFacade.lat_long(params[:state])

  end
end
