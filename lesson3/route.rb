class Route

  attr_reader :route

  def initialize(start_stantion, end_station)
    @route = [start_stantion, end_station]
  end

  def add_stantion(stantion_name)
      route.insert(-2, stantion_name)
  end

  def delete_stantion(stantion_name)
    unless [route.start_stantion, route.end_station].include?(stantion_name) do
      route.delete(stantion_name)
    end
  end


end
