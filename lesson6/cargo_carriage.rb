require_relative 'manufacturer_name.rb'
class CargoCarriage
  include ManufacturerName

  attr_reader :type

  def initialize
    @type = :cargo
  end
end
