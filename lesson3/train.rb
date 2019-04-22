class Train
  attr_reader :route
  attr_accessor :number, :type, :speed

  def initialize(number, type, carriage_quantity)
    @number = number
    @type = type
    @carriage_quantity = carriage_quantity
    @speed = 0
  end

  def accelerate(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def add_carriage
    @carriage_quantity += 1 if self.speed.zero?
  end

  def delete_carriage
    @carriage_quantity -= 1 if self.speed.zero? && carriage_quantity.positive?
  end

  def get_route(route)
    @route = route
    @station_index = 0
    current_station.arrival(self)
  end

  def current_station
    route.stations[@station_index + 1]
  end

  def next_station
    route.stations[@station_index + 1]
  end

  def previous_station
    route.stations[@station_index - 1] if @station_index.positive?
  end

  def move_next
    return unless next_station

    current_station.departure(self)
    next_station.arrival(self)
    @station_index += 1
  end

  def move_back
    return unless prev_station

    current_station.departure(self)
    prev_station.arrival(self)
    @station_index -= 1
  end
end
