# frozen_string_literal: true

require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe SearchSortCars do
  let(:cars) { create_list(:car, 5) }

  describe '#call' do
    context 'when there are no sort parameters' do
      it 'returns cars in the default order' do
        search = SearchSortCars.new(Car.all, {})
        result = search.call

        expect(result.first).to eq(Car.first)
      end
    end
    context 'when filtering by make and model' do
      it 'returns cars that match the make and model' do
        car1 = create(:car, make: 'Honda', model: 'Civic')
        car2 = create(:car, make: 'Toyota', model: 'Corolla')

        search = SearchSortCars.new(Car.all, make: 'Honda', model: 'Civic')
        result = search.call

        expect(result).to include(car1)
        expect(result).not_to include(car2)
      end
    end

    context 'when filtering by year, price, and odometer' do
      it 'returns cars that match the filter parameters' do
        car1 = create(:car, year: 2010, price: 5000, odometer: 50_000)
        car2 = create(:car, year: 2015, price: 10_000, odometer: 75_000)
        car3 = create(:car, year: 2018, price: 15_000, odometer: 100_000)

        search = SearchSortCars.new(Car.all, year_from: 2012, year_to: 2018, price_from: 8000, price_to: 12_000,
                                             odometer_from: 60_000, odometer_to: 90_000)
        result = search.call

        expect(result).to include(car2)
        expect(result).not_to include(car1, car3)

        search = SearchSortCars.new(Car.all, year_from: 2012, year_to: 2018)
        result = search.call

        expect(result).to include(car2, car3)
        expect(result).not_to include(car1)

        search = SearchSortCars.new(Car.all, price_from: 6000, price_to: 12_000)
        result = search.call

        expect(result).to include(car2)
        expect(result).not_to include(car1, car3)

        search = SearchSortCars.new(Car.all, odometer_from: 70_000, odometer_to: 110_000)
        result = search.call

        expect(result).to include(car2, car3)
        expect(result).not_to include(car1)

        search = SearchSortCars.new(Car.all, year_to: 2015)
        result = search.call

        expect(result).to include(car1, car2)
        expect(result).not_to include(car3)

        search = SearchSortCars.new(Car.all, year_from: 2016)
        result = search.call

        expect(result).to include(car3)
        expect(result).not_to include(car1, car2)
      end
    end

    context 'when sorting by date added and price' do
      it 'returns cars sorted in the specified direction' do
        car1 = create(:car, created_at: 1.day.ago, price: 5000)

        search1 = SearchSortCars.new(Car.all, sort: 'date_added_desc')
        result1 = search1.call

        expect(result1.first).to eq(car1)

        search2 = SearchSortCars.new(Car.all, sort: 'price_asc')
        result2 = search2.call

        expect(result2.first).to eq(car1)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
# Factory Bot factories

FactoryBot.define do
  factory :car do
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    year { rand(2000..2022) }
    odometer { rand(1000..100_000) }
    price { rand(1000..50_000) }
    description { FFaker::Lorem.paragraph }
  end
end
