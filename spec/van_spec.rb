require_relative "../lib/van"
require_relative "../lib/docking_station"
require_relative "../lib/bike"

describe Van do

  let(:bike) { Bike.new }
  let(:van) { Van.new }
  let(:station) { DockingStation.new(:capacity => 123) }

  it "should be able to accept broken bikes" do
    broken_bike = Bike.new
    broken_bike.break
    van.dock(broken_bike)
    expect(van.broken_bikes).to eq([broken_bike])
  end

  xit 'should be able to check out broken bikes from a station' do
    # create a station with a mix of broken and working bikes
    # ask a van to check out all broken bikes
    # expect the station to have no broken bikes
    # expect the van to have all broken bikes
  end

  it "unloads working bikes to a station" do
    working_bike = Bike.new
    van.dock(working_bike)
    expect(van.available_bikes.length).to eq(1)
    expect(van.available_bikes.first).to eq(working_bike)
    van.unload_to_station(working_bike, station)
    expect(van.available_bikes.length).to eq(0)
    expect(station.available_bikes.length).to eq(1)
  end
end