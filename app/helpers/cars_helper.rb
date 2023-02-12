# frozen_string_literal: true

module CarsHelper
  # rubocop:disable all
  def sort_link(sort_order, title)
    hash = {
      sort: sort_order,
      make: params[:make],
      model: params[:model],
      year_from: params[:year_from],
      year_to: params[:year_to],
      price_from: params[:price_from],
      price_to: params[:price_to],
      odometer_from: params[:odometer_from],
      odometer_to: params[:odometer_to],
      page: params[:page]
    }
    link_to title, cars_path(hash)
  end

  def request_params
    { make: @request.make, model: @request.model, price_from: @request.price_from, price_to: @request.price_to,
      year_from: @request.year_from, year_to: @request.year_to, odometer_from: @request.odometer_from,
      odometer_to: @request.odometer_to, user_id: @request.user_id }
  end

  # rubocop:enable all
end
