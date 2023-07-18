# frozen_string_literal: true

RSpec.describe SearchQueryCars do
  subject(:search) { described_class.new(Car.all, search_params) }

  let(:search_params) { {} }

  describe '#call' do
    context 'when filtering by make' do
      let(:honda) { create(:car, make: 'Honda', model: 'Civic') }
      let(:toyota) { create(:car, make: 'Toyota', model: 'Corolla') }
      let(:search_params) { { make: 'Honda' } }

      it 'returns cars that match the make' do
        expect(search.call).to include(honda)
        expect(search.call).not_to include(toyota)
      end
    end

    context 'when filtering by model' do
      let(:honda) { create(:car, make: 'Honda', model: 'Civic') }
      let(:toyota) { create(:car, make: 'Toyota', model: 'Corolla') }
      let(:civic) { create(:car, make: 'Honda', model: 'Civic') }
      let(:corolla) { create(:car, make: 'Toyota', model: 'Corolla') }
      let(:search_params) { { model: 'Civic' } }

      it 'returns cars that match the model' do
        expect(search.call).to include(honda, civic)
        expect(search.call).not_to include(toyota, corolla)
      end
    end

    context 'when filtering by year' do
      let(:first_car) { create(:car, year: 2010, price: 5000, odometer: 50_000) }
      let(:second_car) { create(:car, year: 2015, price: 10_000, odometer: 75_000) }
      let(:third_car) { create(:car, year: 2018, price: 15_000, odometer: 100_000) }
      let(:search_params) { { year_to: 2015 } }

      it 'returns cars that match the year filter parameters' do
        expect(search.call).to include(first_car, second_car)
        expect(search.call).not_to include(third_car)
      end

      context 'when filtering by year from' do
        let(:first_car) { create(:car, year: 2010, price: 5000, odometer: 50_000) }
        let(:second_car) { create(:car, year: 2015, price: 10_000, odometer: 75_000) }
        let(:third_car) { create(:car, year: 2018, price: 15_000, odometer: 100_000) }
        let(:search_params) { { year_from: 2016 } }

        it 'returns cars that match the year filter parameters' do
          expect(search.call).to include(third_car)
          expect(search.call).not_to include(first_car, second_car)
        end
      end
    end

    context 'when filtering by price' do
      let(:first_car) { create(:car, year: 2010, price: 5000, odometer: 50_000) }
      let(:second_car) { create(:car, year: 2015, price: 10_000, odometer: 75_000) }
      let(:third_car) { create(:car, year: 2018, price: 15_000, odometer: 100_000) }
      let(:search_params) { { price_from: 6000, price_to: 12_000 } }

      it 'returns cars that match the price filter parameters' do
        expect(search.call).to include(second_car)
        expect(search.call).not_to include(first_car, third_car)
      end
    end

    context 'when filtering by odometer' do
      let(:first_car) { create(:car, year: 2010, price: 5000, odometer: 50_000) }
      let(:second_car) { create(:car, year: 2015, price: 10_000, odometer: 75_000) }
      let(:third_car) { create(:car, year: 2018, price: 15_000, odometer: 100_000) }
      let(:search_params) { { odometer_from: 70_000, odometer_to: 110_000 } }

      it 'returns cars that match the odometer filter parameters' do
        expect(search.call).to include(second_car, third_car)
        expect(search.call).not_to include(first_car)
      end
    end

    context 'when sorting by date added in ascending order' do
      let(:honda) { create(:car, make: 'Honda', model: 'Civic') }
      let(:toyota) { create(:car, make: 'Toyota', model: 'Corolla') }
      let(:search_params) { { sort: 'date_added_asc' } }

      it 'returns cars in the ascending order of date added' do
        expect(search.call.map(&:id)).to eq(Car.all.order(created_at: :asc).pluck(:id))
      end
    end

    context 'when sorting by date added in descending order' do
      let(:honda) { create(:car, make: 'Honda', model: 'Civic') }
      let(:toyota) { create(:car, make: 'Toyota', model: 'Corolla') }
      let(:search_params) { { sort: 'date_added_desc' } }

      it 'returns cars in the ascending order of date added' do
        expect(search.call.map(&:id)).to eq(Car.all.order(created_at: :desc).pluck(:id))
      end
    end

    context 'when sorting by price in ascending order' do
      let(:honda) { create(:car, make: 'Honda', model: 'Civic') }
      let(:toyota) { create(:car, make: 'Toyota', model: 'Corolla') }
      let(:search_params) { { sort: 'price_asc' } }

      it 'returns cars in the ascending order of date added' do
        expect(search.call.map(&:id)).to eq(Car.all.order(price: :asc).pluck(:id))
      end
    end

    context 'when sorting by price in descending order' do
      let(:honda) { create(:car, make: 'Honda', model: 'Civic') }
      let(:toyota) { create(:car, make: 'Toyota', model: 'Corolla') }
      let(:search_params) { { sort: 'price_desc' } }

      it 'returns cars in the ascending order of date added' do
        expect(search.call.map(&:id)).to eq(Car.all.order(price: :desc).pluck(:id))
      end
    end
  end
end
