class PassengerTrain < Train
  def initialize(number)
    super
    @using_types_of_carriages = %i[passenger]
  end

  protected

  def attachable_carriage?(carriage)
    carriage.is_a?(PassengerCarriage)
  end
end
