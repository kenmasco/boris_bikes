#link to the Bike class
require_relative "../lib/bike"

#we're decribing the funtionality of a specific class, Bike
describe Bike do
  #this is a specfic feature (behaviour) that we expect to be present
  it "should not be broken after we create it" do
    bike = Bike.new #initialize a new object of Bike class
    expect(bike).not_to be_broken
  end 
end
