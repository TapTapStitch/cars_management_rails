# frozen_string_literal: true

class SearchRequest < ApplicationRecord
  belongs_to :user, optional: true
  validates :price_from, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :price_to, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :year_from, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :year_to, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :odometer_from, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :odometer_to, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
end
