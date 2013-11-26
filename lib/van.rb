require_relative "../lib/bike_container"

class Van
  include BikeContainer

  def broken_bikes
    bikes.select {|bike| bike.broken? }
  end

  def interact(station)
    station.inter(sdfsdf)
  end

end
