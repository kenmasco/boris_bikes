module BikeContainer

  DEFAULT_CAPACITY = 10

    def bikes
      @bikes ||= []
    end

    def capacity
      @capacity ||= DEFAULT_CAPACITY
    end

    def capacity=(value)
      @capacity = value
    end
    #to use this, you specify the object and then call the method
    #e.g.
    # DockingStation.new.capacity = 50 # => .capacity =(50)

    def bike_count
      bikes.count
    end

    def dock(bike)
      raise "Station is full" if full?
      bikes << bike
    end

    def release(bike)
      raise "Holder is empty" if empty?
      unless bike.is_a? Bike
        raise "Not a valid bike"
      end
      @bikes.delete(bike)
    end

    def empty?
      bike_count == 0
    end

    def full?
      bike_count == capacity
    end

    def available_bikes
      bikes.reject {|bike| bike.broken? }
    end

    def broken_bikes
      bikes.select {|bike| bike.broken? }
    end

    def unload_to(container, bike)
      container.dock(release(bike))
    end
end

