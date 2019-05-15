require_relative 'manufacturer_name.rb'
class PassengerCarriage
  include ManufacturerName

  attr_reader :type

  def initialize
    @type = :passenger
  end
end
