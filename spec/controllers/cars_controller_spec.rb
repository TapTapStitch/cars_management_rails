# frozen_string_literal: true

RSpec.describe CarsController do
  include Devise::Test::ControllerHelpers
  describe '#index' do
    let(:search_params) { attributes_for(:search_request) }
    let(:user) { create(:user) }

    context 'when valid search params are provided' do
      before do
        sign_in user
        get :index, params: search_params
      end

      it 'creates a SearchRequest object with the correct attributes' do
        expect(assigns(:search_request).make).to eq(search_params[:make])
        expect(assigns(:search_request).model).to eq(search_params[:model])
        expect(assigns(:search_request).price_from).to eq(search_params[:price_from])
        expect(assigns(:search_request).price_to).to eq(search_params[:price_to])
        expect(assigns(:search_request).year_from).to eq(search_params[:year_from])
        expect(assigns(:search_request).year_to).to eq(search_params[:year_to])
        expect(assigns(:search_request).odometer_from).to eq(search_params[:odometer_from])
        expect(assigns(:search_request).odometer_to).to eq(search_params[:odometer_to])
      end

      it 'populates @cars with Car objects' do
        expect(assigns(:cars)).to all(be_an_instance_of(Car))
      end

      it 'sets @number_of_cars to a string representation of the number of cars' do
        expect(assigns(:total_cars_count)).to eq(assigns(:cars).length)
      end

      it 'paginate works' do
        expect(assigns(:pagy)).to be_an_instance_of(Pagy)
      end
    end

    context 'when invalid search params are provided' do
      before do
        invalid_params = { price_from: -21_312 }
        get :index, params: invalid_params
      end

      it 'does not populate @cars with Car objects' do
        expect(assigns(:cars)).to be_nil
      end

      it 'does not set @number_of_cars' do
        expect(assigns(:total_cars_count)).to be_nil
      end

      it 'does not paginate' do
        expect(assigns(:pagy)).to be_nil
      end
    end
  end
end
