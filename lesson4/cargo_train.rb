class CargoTrain < Train
  def initialize(number)
    super
    @using_types_of_carriages = %i[:cargo]
  end
end
