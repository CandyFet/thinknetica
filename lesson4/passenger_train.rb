class PassengerTrain < Train
  def initialize(number)
    super
  end

  protected

  def attachable_carriage?(carriage)
    carriage.is_a?(PassengerCarriage)
  end
end
