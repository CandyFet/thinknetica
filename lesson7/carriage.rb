# frozen_string_literal: true

require_relative 'manufacturer_name.rb'
class Carriage
  include ManufacturerName

  ATTRIBUTE_ERROR = 'Ошибка! Атрибут класса должен быть числом.'

  attr_reader :current_attribute

  def initialize(attribute_amount)
    @attribute_amount = attribute_amount
    @current_attribute = 0
    validate!
  end

  def attribute_left
    @attribute_amount - @current_attribute
  end

  protected

  def validate!
    raise ATTRIBUTE_ERROR if @attribute_amount.class != Integer
  end
end
