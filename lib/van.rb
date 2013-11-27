require_relative "../lib/bike_container"
require_relative "../lib/docking_station"

class Van
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end
    
  def unload_to_station(working_bike, station)
    self.release(working_bike)
    station.dock(working_bike)
  end

  def unload_to_garage(broken_bike, garage)
    self.release(broken_bike)
    garage.dock(broken_bike)
  end

end
