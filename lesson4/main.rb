require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'cargo_carriage.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_carriage.rb'
require_relative 'passenger_train.rb'

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
      case gets.to_i
      when 1 then create_new_station
      when 2 then create_new_train
      when 3 then routes_menu
      when 4 then set_route_to_train
      when 5 then add_a_carriage
      when 6 then delete_a_carriage
      when 7 then move_train_menu
      when 8
        then
        station = select_from_collection(@stations)
        puts station.trains
      else exit
      end
    end
  end

  def create_new_station
    puts 'Введите название станции'
    name = gets.chomp.capitalize!
    @stations << Station.new(name)
    show_user_menu
  end

  def create_new_train
    puts 'Введите номер поезда'
    number = gets.chomp
    @trains << Train.new(number)
    show_user_menu
  end

  def routes_menu
    routes_menu_description
    case gets.to_i
    when 1 then create_new_route
    when 2 then add_station_to_route
    when 3 then delete_route_station
    else show_user_menu
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
    selected_station = select_from_collection(@stations)
    puts 'Выберите маршрут'
    seleceted_route = select_from_collection(@routes)
    seleceted_route.add_station(selected_station)
  end

  def delete_route_station
    puts 'Выберите маршрут для удаления станции'
    seleceted_route = select_from_collection(@routes)
    puts 'Выберите станцию для удаления'
    selected_station = select_from_collection(@stations)
    seleceted_route.delete_station(selected_station)
  end

  def set_route_to_train
    puts 'Выберите поезд для назначения маршрута'
    selected_train = select_from_collection(@trains)
    puts 'Выберите маршрут'
    seleceted_route = select_from_collection(@routes)
    selected_train.route = seleceted_route
  end

  def add_a_carriage
    puts 'Выберите поезд для добавления вагона'
    selected_train = select_from_collection(@trains)
    puts 'Выберите тип вагона, который вы хотите прицепить'
    selected_carriage = select_from_collection(CARRIAGE_TYPES)
    case selected_carriage
    when :cargo then selected_train.add_carriage(CargoCarriage.new)
    when :passenger then selected_train.add_carriage(PassengerCarriage.new)
    end
  end

  def delete_a_carriage
    train = select_from_collection(@trains)
    train.delete_carriage(train.carriages.last)
  end

  def move_train_menu
    train_menu_descriprion
    selected_train = select_from_collection(@trains)
    case gets.to_i
    when 1 then selected_train.move_next
    when 2 then selected_train.move_back
    else show_user_menu
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

  private

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
end
Main.new.show_user_menu
