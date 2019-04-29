require_relative 'instance_counter.rb'
class Station
  attr_reader :name, :trains
  include InstanceCounter

  @stations = []
  def initialize(name)
    @name = name
    @trains = []
    self.class.all << self
    register_instance
  end

  def arrival(train)
    trains << train
  end

  def departure(train)
    trains.delete(train)
  end

  def trains_by_type(type)
    trains.select { |train| train.type == type }
  end

  def to_s
    @name
  end

  def self.all
    @stations
  end
end
