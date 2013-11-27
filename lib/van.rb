Dir["/Users/kennerdeigh/DevProjects/MA-Projects/boris_bikes/lib/*"].each {|file| require file }

class Van
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def load_to_van(bike, van)
    self.release(bike)
    van.dock(bike)
  end
end
