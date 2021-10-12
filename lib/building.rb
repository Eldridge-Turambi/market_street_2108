class Building
  attr_reader :building,
              :units,
              :renters

  def initialize
    @building = building
    @units = []
    @renters = []
  end

  def add_unit(unit)
    @units << unit
  end

  def add_renter(renter)
    @renters << renter
  end

  def average_rent
    unit_rent = @units.map do |unit|
      unit.monthly_rent.to_f
    end
    (unit_rent.sum / @units.length).round(1)
  end

  def rented_units
    @units.find_all do |unit|
      unit.renter != nil
    end
  end

  def most_expensive_rented_apartment
    rented_units.max_by do |unit|
      unit.monthly_rent
    end
  end

  def renter_with_highest_rent
    most_expensive_rented_apartment.max_by do |unit|
      unit.monthly_rent
    end
    most_expensive_rented_apartment.renter
  end

  def units_by_number_of_bedrooms
    result = {}

    @units.each do |unit|
      result[unit.bedrooms] = [unit.number]
    end
  end
    @result
end
