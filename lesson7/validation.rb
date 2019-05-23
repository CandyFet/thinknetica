# frozen_string_literal: true

module Validation
  def valid?
    valid!
    true
  rescue StandardError
    false
  end
end
