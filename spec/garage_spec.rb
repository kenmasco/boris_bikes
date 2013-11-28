Dir["~/DevProjects/MA-Projects/boris_bikes/lib/*.rb"].each {|file| require file }

describe Garage do 

  let(:bike) { Bike.new }
  let(:van) { Van.new(:capacity => 20) }
  let(:station) { DockingStation.new(:capacity => 123) }
  let(:garage) { Garage.new(:capacity => 100) }

  it "should be able to set its own capacity on intializing" do
    expect(garage.capacity).to eq(100)
  end

  it "should be able to fix broken bikes" do
    broken_bike = Bike.new
    broken_bike.break
    garage.dock(broken_bike)
    expect(garage.release(broken_bike)).to_not be_broken
  end

  context 'unloading' do
    before do
      bike.break
      garage.dock(bike)
    end

    it 'unloads a bike to a van' do
      van = double :van
    
      expect(van).to receive(:dock).with(bike)

      garage.load_to(van, bike)
    end

    it 'has one less bike after unloading to a van' do
      van = double :van, dock: nil

      garage.pass_working_bikes_to(van)

      expect(garage.bikes.length).to eq 0
    end
  end
end


__END__

it "should move broken bikes from the garage to the station" do
    bike.break
    garage.dock(bike)
    expect(garage.bikes.length).to eq(1)
    garage.unload_to(van, bike)
    expect(garage.bikes.length).to eq(0)
    expect(van.bikes.length).to eq(1)
    van.unload_to(station, bike)
    expect(van.bikes.length).to eq(0)
    expect(station.bikes.length).to eq(1)
  end