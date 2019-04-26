require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'cargo_carriage.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_carriage.rb'
require_relative 'passenger_train.rb'

class Main
  CARRIAGE_TYPES = %i[cargo passenger].freeze
  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def show_user_menu
    user_menu_discription
    case @user_menu_answer
    when 1 then create_new_station
    when 2 then create_new_train
    when 3 then routes_menu
    when 4 then set_route_to_train
    when 5 then add_a_carriage
    when 6 then delete_a_carriage
    when 7 then
    when 8 then
    else exit
    end
  end

  def user_menu_discription
    puts 'Добро пожаловать в меню программы'
    puts '=' * 88
    puts 'Чтобы создать станцию нажмите 1'
    puts 'Чтобы создать поезд нажмите 2'
    puts 'Чтобы перейти в меню маршрутов нажмите 3'
    puts 'Чтобы наззначить маршрут поезду нажмите 4'
    puts 'Чтобы добавить вагоны поезду нажмите 5'
    puts 'Чтобы отцепить вагоны от поезда нажмите 6'
    puts 'Чтобы переместить поезд между станциями нажмите 7'
    puts 'Чтобы просмотреть список станций и список поездов на станции нажмите 8'
    puts 'Чтобы выйти из программы нажмите 0'
    puts '=' * 88
    @user_menu_answer = gets.to_i
    unless @user_menu_answer.between?(0, 8)
    end
  end

  def create_new_station
    puts 'Введите название станции'
    name = gets.chomp.capitalize!
    @stations.push(Station.new(name))
    show_user_menu
  end

  def create_new_train
    puts 'Введите номер поезда'
    number = gets.to_i
    @trains.push(Train.new(number))
    show_user_menu
  end

  def routes_menu_description
    puts '-' * 88
    puts 'Для создания маршрута нажмите 1'
    puts 'Для добавления станции в маршрут нажмите 2'
    puts 'Для удаления станции из маршрута нажмите 3'
    puts 'Для возврата в главное меню нажмите 0'
    puts '-' * 88
    @routes_menu_answer = gets.to_i
    unless @routes_menu_answer.between?(0, 3)
    end
  end

  def routes_menu
    routes_menu_description
    case @routes_menu_answer
    when 1 then create_new_route
    when 2 then add_a_new_sation_to_route
    when 3 then delete_station_from_route
    else show_user_menu
    end
  end

  def create_new_route
    puts 'Введите начальную и конечную станцию'
    start_station = choose_a_station
    end_station = choose_a_station
    @routes.push(Route.new(start_station, end_station))
    show_user_menu
  end

  def add_a_new_sation_to_route
    @routes[choose_a_route].add_station(choose_a_station)
    show_user_menu
  end

  def delete_station_from_route
    @routes[choose_a_route].delete_station(choose_a_station)
    show_user_menu
  end

  def routes_list
    puts 'Список маршрутов :'
    @routes.map.with_index { |item, index| print("#{index + 1}:#{item.stations}, ") }
  end

  def choose_a_route
    routes_list
    puts 'Введите номер маршрута, с которым нужно провести операцию'
    choosed_route = gets.to_i - 1
    @routes[choosed_route]
    show_user_menu
  end

  def set_route_to_train
    @trains[choose_a_train].route(choose_a_route)
    show_user_menu
  end

  def trains_list
    puts 'Список всех поездов :'
    @trains.map.with_index { |item, index| print("#{index + 1}:#{item.number}, ") }
  end

  def choose_a_train
    trains_list
    puts 'Введите номер поезда, с которым нужно провести операцию'
    choosed_train = gets.to_i - 1
    @trains[choosed_train]
    show_user_menu
  end

  def station_list
    puts 'Список всех станций :'
    @stations.map.with_index { |item, index| print("#{index + 1}:#{item.name}, ") }
  end

  def choose_a_station
    station_list
    puts 'Введите номер станции, с которой нужно провести операцию'
    choosed_station = gets.to_i - 1
    @stations[choosed_station]
  end

  def add_a_carriage
    choose_a_train.add_carriage(choose_type_of_carriage)
  end

  def delete_a_carriage
    train = choose_a_train
    train.delete_carriage(train.carriages.last)
    show_user_menu
  end

  def choose_type_of_carriage
    puts 'Выберите тип вагона'
    puts 'Введите 1 для выбора грузового вагона'
    puts 'Введите 2 для выбора пассажирского вагона'
    choosed_carriage = gets.to_i - 1
    CARRIAGE_TYPES[choosed_carriage] unless choosed_carriage.between?(1, 2)
    show_user_menu
  end

  def move_train_menu

  end

  def train_menu_discriprion
    puts 'Введите 1 чтобы переместить поезд на следующую станцию'
    puts 'Введите 2 чтобы переместить поезд на предыдущую станцию'
    puts 'Введите 0 чтобы перейти в главное меню'

  end
end

Main.new.show_user_menu
