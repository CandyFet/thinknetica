class PassengerTrain < Train
  def initialize(number)
    super
    @using_types_of_carriages = %i[:passenger]
  end
end
