# frozen_string_literal: true

RSpec.describe SearchQueryCars do
  let(:honda) { create(:car, make: 'Honda', model: 'Civic') }
  let(:toyota) { create(:car, make: 'Toyota', model: 'Corolla') }
  let(:civic) { create(:car, make: 'Honda', model: 'Civic') }
  let(:corolla) { create(:car, make: 'Toyota', model: 'Corolla') }
  let(:car1) { create(:car, year: 2010, price: 5000, odometer: 50_000) }
  let(:car2) { create(:car, year: 2015, price: 10_000, odometer: 75_000) }
  let(:car3) { create(:car, year: 2018, price: 15_000, odometer: 100_000) }

  describe '#call' do
    context 'when filtering by make' do
      it 'returns cars that match the make' do
        search = described_class.new(Car.all, make: 'Honda')
        result = search.call

        expect(result).to include(honda)
        expect(result).not_to include(toyota)
      end
    end

    context 'when filtering by model' do
      it 'returns cars that match the model' do
        search = described_class.new(Car.all, model: 'Civic')
        result = search.call

        expect(result).to include(honda, civic)
        expect(result).not_to include(toyota, corolla)
      end
    end

    context 'when filtering by year' do
      it 'returns cars that match the year filter parameters' do
        search = described_class.new(Car.all, year_to: 2015)
        result = search.call

        expect(result).to include(car1, car2)
        expect(result).not_to include(car3)

        search = described_class.new(Car.all, year_from: 2016)
        result = search.call

        expect(result).to include(car3)
        expect(result).not_to include(car1, car2)
      end
    end

    context 'when filtering by price' do
      it 'returns cars that match the price filter parameters' do
        search = described_class.new(Car.all, price_from: 6000, price_to: 12_000)
        result = search.call

        expect(result).to include(car2)
        expect(result).not_to include(car1, car3)
      end
    end

    context 'when filtering by odometer' do
      it 'returns cars that match the odometer filter parameters' do
        search = described_class.new(Car.all, odometer_from: 70_000, odometer_to: 110_000)
        result = search.call

        expect(result).to include(car2, car3)
        expect(result).not_to include(car1)
      end
    end

    context 'when sorting by date added in ascending order' do
      it 'returns cars in the ascending order of date added' do
        search = described_class.new(Car.all, { sort: 'date_added_asc' })
        sorted_cars = search.call
        expect(sorted_cars.map(&:id)).to eq(Car.all.order(created_at: :asc).pluck(:id))
      end
    end

    context 'when sorting by date added in descending order' do
      it 'returns cars in the ascending order of date added' do
        search = described_class.new(Car.all, { sort: 'date_added_desc' })
        sorted_cars = search.call
        expect(sorted_cars.map(&:id)).to eq(Car.all.order(created_at: :desc).pluck(:id))
      end
    end

    context 'when sorting by price in ascending order' do
      it 'returns cars in the ascending order of date added' do
        search = described_class.new(Car.all, { sort: 'price_asc' })
        sorted_cars = search.call
        expect(sorted_cars.map(&:id)).to eq(Car.all.order(price: :asc).pluck(:id))
      end
    end

    context 'when sorting by price in descending order' do
      it 'returns cars in the ascending order of date added' do
        search = described_class.new(Car.all, { sort: 'price_desc' })
        sorted_cars = search.call
        expect(sorted_cars.map(&:id)).to eq(Car.all.order(price: :desc).pluck(:id))
      end
    end
  end
end
