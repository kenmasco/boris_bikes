require_relative "../lib/van"

describe Van do

  let(:bike) { Bike.new }
  let (:van) { Van.new }

  it "should be able checkout broken bikes" do
    broken_bike = Bike.new
    broken_bike.break
    van.dock(broken_bike)
    puts van.broken_bikes
    expect(van.broken_bikes).to eq([broken_bike])
  end
  
end