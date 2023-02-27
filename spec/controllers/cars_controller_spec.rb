# frozen_string_literal: true
# rubocop:disable Metrics/BlockLength

RSpec.describe CarsController, type: :controller do
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
end
# rubocop:enable Metrics/BlockLength
