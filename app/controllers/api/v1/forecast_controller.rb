class Api::V1::ForecastController < ApplicationController
  def index
    MapQuestFacade.lat_long(params[:state])
  end
end
