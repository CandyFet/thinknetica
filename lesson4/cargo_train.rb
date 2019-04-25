class CargoTrain < Train
  def initialize
    super

    @using_types_of_carriages = %i[:cargo]
  end
end
