Dir["/Users/kennerdeigh/DevProjects/MA-Projects/boris_bikes/lib/*"].each {|file| require file }

describe DockingStation do

  let(:station) { DockingStation.new(:capacity => 123) }
  let (:van) { Van.new } # van = Van.new
  let (:bike) { Bike.new }

  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

  # it "should load broken bikes to a van" do
  #   broken_bike = Bike.new
  #   broken_bike.break
  #   station.dock(broken_bike)
  #   expect(station.broken_bikes.length).to eq(1)
  #   expect(station.broken_bikes.first).to eq(broken_bike)
  #   station.load_to_van(broken_bike, van)
  #   expect(station.broken_bikes.length).to eq(0)
  #   expect(van.broken_bikes.length).to eq(1)
  # end

  

end
