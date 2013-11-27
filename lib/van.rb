require_relative "../lib/bike_container"
require_relative "../lib/docking_station"

class Van
  include BikeContainer

  def unload_to_station(working_bike, station)
    self.release(working_bike)
    station.dock(working_bike)
  end
end
