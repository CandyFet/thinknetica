# frozen_string_literal: true

require_relative 'carriage.rb'
class PassengerCarriage < Carriage
  def initialize(seats)
    super
  end

  def occupy_capacity
    super(1)
  end
end
