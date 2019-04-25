class CargoCarriage
  attr_reader :type

  def initialize
    @type = :cargo
  end

  def self.to_s
    "Cargo / Грузовой"
  end
end
