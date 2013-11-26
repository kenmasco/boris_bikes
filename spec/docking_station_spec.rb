require_relative "../lib/docking_station"
require_relative "../lib/van"

describe DockingStation do

  let(:station) { DockingStation.new(:capacity => 123) }
  let (:van) { Van.new }

  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end
end