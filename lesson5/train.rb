require_relative 'manufacturer_name.rb'
require_relative 'instance_counter.rb'

class Train

  @@trains = {}
  include ManufacturerName
  include InstanceCounter
  attr_reader :number, :speed, :carriages

  def self.find(number)
    @@trains[number]
  end

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
    @@trains[@number] = self
    register_instance
  end

  def accelerate(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
    return unless attachable_carriage?(carriage)
    return unless speed.zero?

    @carriages << carriage
  end

  def delete_carriage(carriage)
    @carriages.delete(carriage) if self.speed.zero?
  end

  def route=(route)
    @route = route
    @station_index = 0
    current_station.arrival(self)
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
    @route.stations[@station_index + 1]
  end

  def previous_station
    @route.stations[@station_index - 1] if @station_index.positive?
  end

  def move_next
    return unless next_station

    current_station.departure(self)
    next_station.arrival(self)
    @station_index += 1
  end

  def move_back
    return unless previous_station

    current_station.departure(self)
    previous_station.arrival(self)
    @station_index -= 1
  end

  protected

  def attachable_carriage?(carriage)
    raise NotImplementedError
  end

  def to_s
    @number
  end
end
