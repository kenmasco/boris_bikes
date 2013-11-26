require_relative "../lib/bike_container"

class DockingStation
  
  include BikeContainer

  def initialize(options = {})
    # self.capacity is calling the capicity=() method
    # (not the equals sign) defined in BikeContainer
    # capacity (the second argument to fetch()) is calling 
    # the capacity() methid in BikeContainer
    self.capacity = options.fetch(:capacity, capacity)
  end

end
