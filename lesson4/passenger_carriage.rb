class PassengerCarriage
  attr_reader :type

  def initialize
    @type = :passenger
  end

  def self.to_s
    "Passenger / Пассажирский"
  end
end
