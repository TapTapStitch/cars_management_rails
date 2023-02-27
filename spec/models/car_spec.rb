# frozen_string_literal: true

RSpec.describe Car do
  describe 'validations' do
    let(:car) { build(:car) }

    it 'is valid with valid attributes' do
      expect(car).to be_valid
    end

    it 'is invalid without a make' do
      car.make = nil
      expect(car).not_to be_valid
    end

    it 'is invalid without a model' do
      car.model = nil
      expect(car).not_to be_valid
    end

    it 'is invalid without a year' do
      car.year = nil
      expect(car).not_to be_valid
    end

    it 'is invalid without an odometer reading' do
      car.odometer = nil
      expect(car).not_to be_valid
    end

    it 'is invalid without a price' do
      car.price = nil
      expect(car).not_to be_valid
    end
  end

  describe 'factories' do
    it 'has a valid car factory' do
      expect(build(:car)).to be_valid
    end

    it 'can create multiple cars using the car factory' do
      expect(create_list(:car, 3)).to all(be_valid)
    end
  end
end
