require './lib/renter'
require './lib/apartment'
require './lib/building'

RSpec.describe 'Iteration 2' do
  before :each do
    @building = Building.new

    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @unit4 =Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})

    @renter1 = Renter.new("Spencer")
    @renter2 = Renter.new("Jessie")
    @renter3 = Renter.new("Max")
    #@renter1 = Renter.new("Aurora")
    #@renter2 = Renter.new("Tim")

  end

  it "is an instance of Building" do
    expect(@building).to be_an_instance_of(Building)
  end

  it "has empty units by default" do
    expect(@building.units).to eq([])
  end

  it "can add units" do

    @building.add_unit(@unit1)
    @building.add_unit(@unit2)

    expect(@building.units).to eq([@unit1, @unit2])
  end

  it "has no renters" do
    expect(@building.renters).to eq([])
  end

  it "can add renters" do
    @building.add_renter(@renter1)
    @building.add_renter(@renter2)

    expect(@building.renters).to eq([@renter1, @renter2])
  end

  it "can find the average rent" do
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)

    expect(@building.average_rent).to eq(1099.5)
  end

  it "can list occupied rooms" do
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)

    @unit1.add_renter(@renter1)

    expect(@building.rented_units).to eq([@unit1])
  end

  it 'knows which renter has highest rent' do
    @building = Building.new

    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @unit4 =Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})

    @renter1 = Renter.new("Spencer")
    @renter3 = Renter.new("Max")

    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @building.add_unit(@unit4)

    expect(@building.renter_with_highest_rent).to eq(@renter1)
  end

  it "knows how many units by number of bedrooms" do
    @building = Building.new

    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @unit4 =Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})

    @renter1 = Renter.new("Spencer")
    @renter3 = Renter.new("Max")

    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @building.add_unit(@unit4)

    expected = {
      3 => ["D4"],
      2 => ["B2", "C3"],
      1 => ["A1"]
    }

    expect(@building.units_by_number_of_bedrooms).to eq(expected)
  end
end
