# frozen_string_literal: true

class SearchQueryCars
  attr_reader :cars, :params

  def initialize(cars, params)
    @cars = cars
    @params = params
  end

  def call
    filter_cars_by_make_model
    filter_year_price_odometer
    sort_cars_by_direction
    cars
  end

  private

  def filter_cars_by_make_model
    cars.where!(make: params[:make]) if params[:make].present?
    cars.where!(model: params[:model]) if params[:model].present?
  end

  def filter_year_price_odometer
    filter_cars(:year, 'year')
    filter_cars(:price, 'price')
    filter_cars(:odometer, 'odometer')
  end

  def sort_cars_by_direction
    sort_orders = {
      'date_added_desc' => { created_at: :desc },
      'date_added_asc' => { created_at: :asc },
      'price_desc' => { price: :desc },
      'price_asc' => { price: :asc }
    }
    cars.order!(sort_orders[params[:sort]]) if sort_orders.key?(params[:sort])
  end

  # rubocop:disable all
  def filter_cars(type, column)
    from_param = "#{column}_from".to_sym
    to_param = "#{column}_to".to_sym

    if params[from_param].present? && params[to_param].present?
      cars.where!(type => params[from_param]..params[to_param])
    elsif params[from_param].present?
      cars.where!("#{type} >= :from", from: params[from_param])
    elsif params[to_param].present?
      cars.where!("#{type} <= :to", to: params[to_param])
    end
  end

  # rubocop:enable all
end
