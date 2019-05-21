# frozen_string_literal: true

require_relative 'manufacturer_name.rb'
class CargoCarriage
  include ManufacturerName

  ATTRIBUTE_ERROR = 'Ошибка! Объем должен быть числом.'

  attr_reader :type, :current_volume

  def initialize(volume_amount)
    @type = :cargo
    @current_volume = 0
    @volume_amount = volume_amount
    validate!
  end

  def increase_volume(volume)
    @current_volume += volume unless @volume_amount <= @current_volume + volume
  end

  def volume_left
    puts @volume_amount - @current_volume
  end

  protected

  def validate!
    raise ATTRIBUTE_ERROR if @volume_amount.class != Integer
  end
end
