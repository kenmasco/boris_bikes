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
end


