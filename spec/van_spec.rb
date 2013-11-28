Dir["/Users/kennerdeigh/DevProjects/MA-Projects/boris_bikes/lib/*"].each {|file| require file }

describe Van do

  let(:bike) { Bike.new }
  let(:van) { Van.new(:capacity => 20) }
  let(:station) { DockingStation.new(:capacity => 123) }
  let(:garage) { Garage.new }

it "should allow setting default capacity on initialising" do
    expect(van.capacity).to eq(20)
  end

  it "should be able to accept bikes" do
    van.dock(bike)
    expect(van.bikes).to eq([bike])
  end

   it "passes working bikes to a station" do
    van.dock(bike)
    van.pass_working_bikes_to(station)
    expect(van.available_bikes.length).to eq(0)
    expect(station.available_bikes).to eq([bike])
  end

  context 'moving' do
    before do
      bike.break
    end

  it "moves working bikes from the garage to the station" do
    garage.dock(bike)
    expect(garage.bikes.length).to eq(1)
    garage.load_to(van, bike)
    expect(garage.bikes.length).to eq(0)
    expect(van.bikes.length).to eq(1)
    van.load_to(station, bike)
    expect(van.bikes.length).to eq(0)
    expect(station.bikes.length).to eq(1)
  end

  it "should move broken bikes from the station to the garage" do
    station.dock(bike)
    station.load_to(van, bike)
    van.load_to(garage, bike)
    expect(van.broken_bikes.length).to eq(0)
    expect(garage.broken_bikes.length).to eq(0)  
    expect(garage.bikes.length).to eq(1)  
  end
end
end

