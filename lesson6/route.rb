require_relative 'instance_counter.rb'
class Route
  attr_reader :stations
  include InstanceCounter
  NAME_PATTERN = /^\w/.freeze
  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    validate!
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    return if [stations.first, stations.last].include?(station)

    stations.delete(station)
  end

  def to_s
    [stations.first, stations.last].join(' - ')
  end

  protected

  def validate!
    if stations.first !~ NAME_PATTERN || stations.last !~ NAME_PATTERN
      raise 'Ошибка! Имя станции должно начинаться с цифры или с буквы'
    end
  end
end
