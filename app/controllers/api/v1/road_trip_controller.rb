class Api::V1::RoadTripController < ApplicationController
  def create
    binding.pry
    MapQuestFacade.directions_info(params)
  end
end
