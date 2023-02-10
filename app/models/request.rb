# frozen_string_literal: true

class Request < ApplicationRecord
  validates :make, format: { with: /\A[a-zA-Z0-9]+\z/, message: I18n.t('errors.must_be_string') }, allow_blank: true
  validates :model, format: { with: /\A[a-zA-Z0-9]+\z/, message: I18n.t('errors.must_be_string') }, allow_blank: true
  validates :price_from, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :price_to, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :year_from, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :year_to, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :odometer_from, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :odometer_to, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
end
