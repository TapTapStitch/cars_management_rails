# frozen_string_literal: true

class CarsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!, only: [:user_searches]

  def index
    @search_request = SearchRequest.new(search_params)
    if @search_request.valid?
      @cars = SearchQueryCars.new(Car.all, params).call
      @total_cars_count = @cars.length
      @pagy, @cars = pagy(@cars, items: 5)
      save_search_request if @total_cars_count.positive?
    else
      display_errors
    end
  end

  def search; end

  def user_searches
    @user_requests = current_user.search_requests
  end

  private

  def save_search_request
    SaveSearchRequest.new(@search_request, current_user.id).call if user_signed_in?
  end

  def display_errors
    flash.alert = @search_request.errors.full_messages.join('<br>')
    redirect_to search_cars_path
  end

  def search_params
    params.permit(:make, :model, :price_from, :price_to, :year_from, :year_to, :odometer_from, :odometer_to)
  end
end
