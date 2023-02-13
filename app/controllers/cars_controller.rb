# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: [:user_searches]
  http_basic_authenticate_with name: 'admin', password: 'adminpassword', except: %i[index show search user_searches]

  def index
    @search_request = SearchRequest.new(search_params)
    return unless @search_request.valid?

    @cars = SearchSortCars.new(Car.all, params).call
    @number_of_cars = @cars.length.to_s
    @cars = @cars.paginate(page: params[:page], per_page: 5)
    save_request if user_signed_in? && @cars.length.positive?
  end

  def search; end

  def show; end

  def new
    @car = Car.new
  end

  def edit; end

  def user_searches
    @user_requests = SearchRequest.where(user_id: current_user.id)
  end

  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to car_url(@car), notice: t('success.car_created') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: t('success.car_updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: t('success.car_destroyed') }
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def save_request
    existing_request = SearchRequest.exists?(request_params(@search_request))
    if existing_request
      SearchRequest.where(request_params(@search_request)).update(updated_at: Time.zone.now)
    else
      @search_request.save
    end
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :odometer, :price, :description)
  end

  def search_params
    user_id = current_user.id if user_signed_in?
    params.permit(:make, :model, :price_from, :price_to, :year_from, :year_to, :odometer_from,
                  :odometer_to).merge(user_id:)
  end

  def request_params(request)
    { make: request.make, model: request.model, price_from: request.price_from, price_to: request.price_to,
      year_from: request.year_from, year_to: request.year_to, odometer_from: request.odometer_from,
      odometer_to: request.odometer_to, user_id: request.user_id }
  end
end
