require_relative 'instance_counter.rb'
class Station
  attr_reader :name, :trains
  include InstanceCounter
  NAME_PATTERN = /^\w/.freeze

  @stations = []

  def self.all
    @stations
  end

  def initialize(name)
    @name = name
    @trains = []
    self.class.all << self
    validate!
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

  protected

  def validate!
    if name !~ NAME_PATTERN
      raise 'Ошибка! Имя станции должно начинаться с цифры или с буквы'
    end
  end
end
