class PassengerTrain < Train
  def initialize(number)
    super
    @type_of_carriage = %i[:passenger]
  end
end
