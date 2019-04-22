class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains= []
  end

  def arrival(train)
    trains << train
  end

  def departure(train)
    trains.delete(train)
  end

  def train_type(type)
    trains.select { |train| train.type == type}
  end

end
