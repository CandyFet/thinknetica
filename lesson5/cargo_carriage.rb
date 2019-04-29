class CargoCarriage
  include ManufacturerName
  attr_reader :type

  def initialize
    @type = :cargo
  end
end
