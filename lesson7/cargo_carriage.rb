# frozen_string_literal: true

require_relative 'carriage.rb'
class CargoCarriage < Carriage
  attr_reader :type

  def initialize(attribute_amount)
    @type = :cargo
    super
  end

  def increase_volume(volume)
    @current_volume += volume unless @volume_amount <= @current_volume + volume
  end
end
