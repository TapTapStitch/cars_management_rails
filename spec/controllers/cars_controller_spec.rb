# frozen_string_literal: true

require 'rails_helper'
# rubocop:disable Metrics/BlockLength

RSpec.describe CarsController, type: :controller do
  before do
    allow(subject).to receive(:http_basic_authenticate_or_request_with)
      .with(anything).and_return true
  end
  describe '#index' do
    let(:search_params) { FactoryBot.attributes_for(:search_request) }

    context 'when valid search params are provided' do
      before do
        allow(controller).to receive(:user_signed_in?).and_return(true)
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
        expect(assigns(:number_of_cars)).to eq(assigns(:cars).length.to_s)
      end

      it 'paginate works' do
        expect(assigns(:pagy)).to be_an_instance_of(Pagy)
      end
    end

    context 'when user is not signed in' do
      before do
        allow(controller).to receive(:user_signed_in?).and_return(false)
        get :index, params: search_params
      end

      it 'does not save the request' do
        expect(controller).not_to receive(:save_request)
      end
    end
  end
  describe 'GET #new' do
    it 'assigns a new car as @car' do
      get :new
      expect(assigns(:car)).to be_a_new(Car)
    end
  end
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { FactoryBot.attributes_for(:car) }
      it 'creates a new car and redirects to the created car' do
        expect do
          post :create, params: { car: valid_params }
        end.to change(Car, :count).by(1)
        expect(response).to redirect_to(car_url(Car.last.id))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { FactoryBot.attributes_for(:car, make: '') }
      it 'does not create a new car' do
        expect do
          post :create, params: { car: invalid_params }
        end.to_not change(Car, :count)
        expect(response).to render_template(:new)
      end
    end
  end
  describe 'PUT #update' do
    let(:car) { FactoryBot.create(:car) }
    let(:update_params) { FactoryBot.attributes_for(:car, make: 'Toyota') }

    context 'when valid params are provided' do
      before do
        put :update, params: { id: car.id, car: update_params }
      end

      it 'updates the car with the new params' do
        expect(car.reload.make).to eq(update_params[:make])
      end

      it 'redirects to the updated car' do
        expect(response).to redirect_to(car_url(car))
      end
    end

    context 'when invalid params are provided' do
      let(:invalid_params) { FactoryBot.attributes_for(:car, make: '') }

      before do
        put :update, params: { id: car.id, car: invalid_params }
      end

      it 'does not update the car' do
        expect(car.reload.make).not_to eq(invalid_params[:make])
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end
  end
  describe 'DELETE #destroy' do
    let!(:car) { FactoryBot.create(:car) }

    it 'destroys the requested car' do
      expect do
        delete :destroy, params: { id: car.id }
      end.to change(Car, :count).by(-1)
    end

    it 'redirects to the cars index page' do
      delete :destroy, params: { id: car.id }
      expect(response).to redirect_to(cars_url)
    end
  end
end
# rubocop:enable Metrics/BlockLength
