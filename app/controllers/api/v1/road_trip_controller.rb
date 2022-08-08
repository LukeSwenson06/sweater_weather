class Api::V1::RoadTripController < ApplicationController
  def create
    MapQuestFacade.directions_info(params[:origin], params[:destination])
  end
end
