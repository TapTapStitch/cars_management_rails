# frozen_string_literal: true

class CarsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!, only: [:user_searches]

  def index
    @search_request = SearchRequest.new(search_params)
    return unless @search_request.valid?

    @cars = SearchQueryCars.new(Car.all, params).call
    @total_cars_count = @cars.length
    @pagy, @cars = pagy(@cars, items: 5)
    SaveSearchRequest.new(@search_request, current_user.id).call if user_signed_in? && @total_cars_count.positive?
  end

  def search; end

  def user_searches
    @user_requests = current_user.search_requests
  end

  private

  def search_params
    params.permit(:make, :model, :price_from, :price_to, :year_from, :year_to, :odometer_from, :odometer_to)
  end
end
