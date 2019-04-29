class Route
  attr_reader :stations
  include InstanceCounter
  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
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
end
