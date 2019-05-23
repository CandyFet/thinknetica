class PassengerCarriage
  include manufacturer_name
  attr_reader :type

  def initialize
    @type = :passenger
  end
end
