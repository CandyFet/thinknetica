# frozen_string_literal: true

require_relative 'carriage.rb'
class PassengerCarriage < Carriage
  attr_reader :type

  def initialize(attribute_amount)
    @type = :passenger
    super
  end

  def take_a_seat
    @taken_seats += 1 unless @seats < @taken_seats
  end
end
