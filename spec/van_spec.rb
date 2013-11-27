Dir["/Users/kennerdeigh/DevProjects/MA-Projects/boris_bikes/lib/*"].each {|file| require file }

describe Van do

  let(:bike) { Bike.new }
  let(:van) { Van.new(:capacity => 20) }
  let(:station) { DockingStation.new(:capacity => 123) }
  let(:garage) { Garage.new }

it "should allow setting default capacity on initialising" do
    expect(van.capacity).to eq(20)
  end

  it "should be able to accept broken bikes" do
    broken_bike = Bike.new
    broken_bike.break
    van.dock(broken_bike)
    expect(van.broken_bikes).to eq([broken_bike])
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

  it "should move broken bikes from the station to the garage" do
    broken_bike = Bike.new
    broken_bike.break
    station.dock(broken_bike)
    expect(station.broken_bikes.length).to eq(1)
    expect(station.broken_bikes.first).to eq(broken_bike)
    station.load_to_van(broken_bike, van)
    expect(station.broken_bikes.length).to eq(0)
    expect(van.broken_bikes.length).to eq(1)
    van.unload_to_garage(broken_bike, garage)
    expect(van.broken_bikes.length).to eq(0)
    expect(garage.broken_bikes.length).to eq(0)  
    expect(garage.bikes.length).to eq(1)  
  end

end