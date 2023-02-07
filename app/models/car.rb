# frozen_string_literal: true

class Car < ApplicationRecord
  validates :make, :model, :year, :odometer, :price, :added_on, presence: true
end
