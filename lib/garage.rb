require_relative "../lib/bike_container"

class Garage
  include BikeContainer
  
  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def dock(broken_bike)
    broken_bike.fix
    super(broken_bike)
  end
end



