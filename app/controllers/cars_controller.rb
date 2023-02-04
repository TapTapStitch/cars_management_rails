# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]

  SORTING = {
    'A-z' => { make: :asc },
    'Z-a' => { make: :desc }
  }.freeze
  # GET /cars or /cars.json
  def index
    @cars = Car.all
    @cars = @cars.where(make: params[:make]) if params[:make].present?
    @cars = @cars.where(model: params[:model]) if params[:model].present?
    sort_price
    sort_odometer
    sort_year
    @cars = @cars.order(**SORTING.fetch(params[:sort_by])) if params[:sort_by].present?
  end

  # GET /cars/1 or /cars/1.json
  def show; end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit; end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to car_url(@car), notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.fetch(:car, {})
  end

  private

  def sort_year
    if params[:year_from].present? && params[:year_to].present?
      @cars = @cars.where(year: params[:year_from]..params[:year_to])
    elsif params[:year_from].present?
      @cars = @cars.where('year >= :year_from', year_from: params[:year_from])
    elsif params[:year_to].present?
      @cars = @cars.where('year <= :year_to', year_to: params[:year_to])
    end
  end

  def sort_price
    if params[:price_from].present? && params[:price_to].present?
      @cars = @cars.where(price: params[:price_from]..params[:price_to])
    elsif params[:price_from].present?
      @cars = @cars.where('price >= :price_from', price_from: params[:price_from])
    elsif params[:price_to].present?
      @cars = @cars.where('price <= :price_to', price_to: params[:price_to])
    end
  end

  def sort_odometer
    if params[:odometer_from].present? && params[:odometer_to].present?
      @cars = @cars.where(odometer: params[:odometer_from]..params[:odometer_to])
    elsif params[:odometer_from].present?
      @cars = @cars.where('odometer >= :odometer_from', odometer_from: params[:odometer_from])
    elsif params[:odometer_to].present?
      @cars = @cars.where('odometer <= :odometer_to', odometer_to: params[:odometer_to])
    end
  end
end
