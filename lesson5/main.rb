require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'cargo_carriage.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_carriage.rb'
require_relative 'passenger_train.rb'
require_relative 'manufacturer_name.rb'
require_relative 'instance_counter.rb'

class Main
  CARRIAGE_TYPES = %i[cargo passenger].freeze
  DELIMETER = '=' * 88
  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def show_user_menu
    loop do
      user_menu_description
      user_answer
    end
  end

  private

  def create_new_station
    puts 'Введите название станции'
    name = gets.chomp.capitalize!
    @stations << Station.new(name)
  end

  def create_new_train
    puts 'Введите номер поезда'
    number = gets.chomp
    train_type_dialog
    train = train_type_selection(number)
    @trains << train
  end

  def routes_menu
    routes_menu_description
    case gets.to_i
    when 1 then create_new_route
    when 2 then add_station_to_route
    when 3 then delete_route_station
    end
  end

  def create_new_route
    puts 'Введите начальную и конечную станцию'
    start_station = select_from_collection(@stations)
    end_station = select_from_collection(@stations)
    return if start_station.nil? || end_station.nil?
    return if start_station == end_station

    @routes << Route.new(start_station, end_station)
  end

  def add_station_to_route
    puts 'Выберите станцию для добавления в маршрут'
    station = select_from_collection(@stations)
    puts 'Выберите маршрут'
    route = select_from_collection(@routes)
    return if route.nil?
    route.add_station(station)
  end

  def delete_route_station
    puts 'Выберите маршрут для удаления станции'
    route = select_from_collection(@routes)
    puts 'Выберите станцию для удаления'
    station = select_from_collection(route.stations)
    route.delete_station(station)
  end

  def set_route_to_train
    puts 'Выберите поезд для назначения маршрута'
    train = select_from_collection(@trains)
    puts 'Выберите маршрут'
    route = select_from_collection(@routes)
    train.route = route
  end

  def add_a_carriage
    puts 'Выберите поезд для добавления вагона'
    train = select_from_collection(@trains)
    puts 'Выберите тип вагона, который вы хотите прицепить'
    carriage = select_from_collection(CARRIAGE_TYPES)
    case carriage
    when :cargo then train.add_carriage(CargoCarriage.new)
    when :passenger then train.add_carriage(PassengerCarriage.new)
    else return if carriage.nil?
    end
  end

  def delete_a_carriage
    train = select_from_collection(@trains)
    train.delete_carriage(train.carriages.last)
  end

  def move_train_menu
    train_menu_descriprion
    train = select_from_collection(@trains)
    case gets.to_i
    when 1 then train.move_next
    when 2 then train.move_back
    else return if train.nil?
    end
  end

  protected

  def show_collection(collection)
    collection.each_with_index do |item, index|
      puts "#{index + 1}: #{item}"
    end
  end

  def select_from_collection(collection)
    show_collection(collection)
    index = gets.to_i
    return unless index.positive?

    collection[index - 1]
  end

  def train_menu_descriprion
    puts DELIMETER
    puts 'Введите 1 чтобы переместить поезд на следующую станцию'
    puts 'Введите 2 чтобы переместить поезд на предыдущую станцию'
    puts 'Введите 0 чтобы перейти в главное меню'
    puts DELIMETER
  end

  def routes_menu_description
    puts DELIMETER
    puts 'Для создания маршрута нажмите 1'
    puts 'Для добавления станции в маршрут нажмите 2'
    puts 'Для удаления станции из маршрута нажмите 3'
    puts 'Для возврата в главное меню нажмите 0'
    puts DELIMETER
  end

  def user_menu_description
    puts 'Добро пожаловать в меню программы'
    puts DELIMETER
    puts 'Чтобы создать станцию нажмите 1'
    puts 'Чтобы создать поезд нажмите 2'
    puts 'Чтобы перейти в меню маршрутов нажмите 3'
    puts 'Чтобы назначить маршрут поезду нажмите 4'
    puts 'Чтобы добавить вагоны поезду нажмите 5'
    puts 'Чтобы отцепить вагоны от поезда нажмите 6'
    puts 'Чтобы переместить поезд между станциями нажмите 7'
    puts 'Чтобы просмотреть список станций и список поездов на станции нажмите 8'
    puts 'Чтобы выйти из программы нажмите 0'
    puts DELIMETER
  end

  def user_answer
    case gets.to_i
    when 1 then create_new_station
    when 2 then create_new_train
    when 3 then routes_menu
    when 4 then set_route_to_train
    when 5 then add_a_carriage
    when 6 then delete_a_carriage
    when 7 then move_train_menu
    when 8 then show_station_trains
    end
  end

  def train_type_dialog
    puts 'Выберите тип поезда'
    puts 'Нажмите 1 чтобы создать грузовой поезд'
    puts 'Нажмите 2 чтобы создать пассажирский поезд'
  end

  def train_type_selection(number)
    case gets.to_i
    when 1 then train = CargoTrain.new(number)
    when 2 then train = PassengerTrain.new(number)
    end
    train unless train.nil?
  end

  def show_station_trains
    station = select_from_collection(@stations)
    show_collection(station.trains)
  end
end
Main.new.show_user_menu
