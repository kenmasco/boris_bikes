require_relative "../lib/bike_container"

class DockingStation
  
  include BikeContainer

  def initialize(options = {})
    # self.capacity is calling the capicity=() method
    # (note the equals sign) defined in BikeContainer
    # capacity (the second argument to fetch()) is calling 
    # the capacity() method in BikeContainer
    self.capacity = options.fetch(:capacity, capacity)
  end
 
  def load_to_van(broken_bike, van)
    self.release(broken_bike)
    van.dock(broken_bike)
  end

end
