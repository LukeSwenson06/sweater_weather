require 'rails_helper'

RSpec.describe 'MapQuestFacade' do

  it "makes service call and returns an array of MapQuest objects" do
    map = MapQuest.lat_long("denver,CO")

    expect(map).to be_a Array
    expect(map).to be_all MapQuest
  end
end
