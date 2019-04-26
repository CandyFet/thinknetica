class CargoTrain < Train
  def initialize(number)
    super
    @type_of_carriage = %i[:cargo]
  end
end
