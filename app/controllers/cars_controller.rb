# frozen_string_literal: true

class CarsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!, only: [:user_searches]

  def index
    @search_request = SearchRequest.new(search_params)
    return unless @search_request.valid?

    @cars = SearchQueryCars.new(Car.all, params).call
    @number_of_cars = @cars.length.to_s
    @pagy, @cars = pagy(@cars, items: 5)
    save_request if user_signed_in? && @cars.length.positive?
  end

  def search; end

  def user_searches
    @user_requests = current_user.search_requests
  end

  private

  def save_request
    user_search_request = SearchRequest.find_or_initialize_by(request_params(@search_request))
    if user_search_request.persisted?
      user_search_request.update(updated_at: Time.zone.now)
    else
      user_search_request.save
    end
  end

  def search_params
    params.permit(:make, :model, :price_from, :price_to, :year_from, :year_to, :odometer_from, :odometer_to)
  end

  def request_params(request)
    { make: request.make, model: request.model, price_from: request.price_from, price_to: request.price_to,
      year_from: request.year_from, year_to: request.year_to, odometer_from: request.odometer_from,
      odometer_to: request.odometer_to, user_id: current_user.id }
  end
end
