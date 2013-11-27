require_relative "../lib/bike_container"
require_relative "../lib/bike.rb"
require_relative "../lib/van.rb"
require_relative "../lib/docking_station.rb"

class ContainerHolder; include BikeContainer; end

  describe BikeContainer do

    let(:bike) { Bike.new }
    let(:holder) { ContainerHolder.new }

    def fill_holder(holder)
      holder.capacity.times { holder.dock(Bike.new)}
    end

    def empty_holder(holder)
    end

    it "should accept a bike" do
      #we expect the station to have 0 bikes
      expect(holder.bike_count).to eq(0)
      #let's dock a bike into the station
      holder.dock(bike)
      #now we expect the station to have 1 bike
      expect(holder.bike_count).to eq(1)
    end

    it "should only accepts bikes" do

    end

    it "should complain if release is not given a valid bike" do
      fill_holder holder
      expect { holder.release('not_a_bike') }.to raise_error
    end

    it "should not release a bike if it's empty" do
      empty_holder(holder)
      expect(lambda {holder.release(bike) }).to raise_error(RuntimeError)
    end

    it "should release a bike" do
       holder.dock(bike)
       expect(holder.bike_count).to eq (1)
       holder.release(bike)
       expect(holder.bike_count).to eq (0)
    end

    it "should know when it's full" do
      expect(holder).not_to be_full
      fill_holder holder
      expect(holder).to be_full
    end

    it "should not accept a bike if it's full" do
      fill_holder holder
      expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
    end

    it "should provide the list of available bikes" do
      working_bike, broken_bike = Bike.new, Bike.new
      broken_bike.break
      holder.dock(working_bike)
      holder.dock(broken_bike)
      expect(holder.available_bikes).to eq([working_bike])
    end
  end
