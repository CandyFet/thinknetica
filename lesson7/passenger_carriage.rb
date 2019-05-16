# frozen_string_literal: true

require_relative 'manufacturer_name.rb'
class PassengerCarriage
  include ManufacturerName

  ATTRIBUTE_ERROR = 'Ошибка! Количество мест должно быть числом'

  attr_reader :type, :taken_seats

  def initialize(seats)
    @type = :passenger
    @seats = seats
    @taken_seats = 0
    validate!
  end

  def take_a_seat
    @taken_seats += 1 unless @seats < @taken_seats
  end

  def seats_left
    puts @seats - @taken_seats
  end

  private

  def validate!
    raise ATTRIBUTE_ERROR if seats.class != Integer
  end
end
