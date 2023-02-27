# frozen_string_literal: true

RSpec.describe SearchRequest do
  describe 'validations' do
    let(:search_request) { build(:search_request) }

    it 'is valid with valid attributes' do
      expect(search_request).to be_valid
    end

    it 'is valid without a user' do
      search_request.user = nil
      expect(search_request).to be_valid
    end

    it 'is valid without a price_from' do
      search_request.price_from = nil
      expect(search_request).to be_valid
    end

    it 'is valid without a price_to' do
      search_request.price_to = nil
      expect(search_request).to be_valid
    end

    it 'is valid without a year_from' do
      search_request.year_from = nil
      expect(search_request).to be_valid
    end

    it 'is valid without a year_to' do
      search_request.year_to = nil
      expect(search_request).to be_valid
    end

    it 'is valid without an odometer_from' do
      search_request.odometer_from = nil
      expect(search_request).to be_valid
    end

    it 'is valid without an odometer_to' do
      search_request.odometer_to = nil
      expect(search_request).to be_valid
    end

    it 'is invalid with a negative price_from' do
      search_request.price_from = -1
      expect(search_request).not_to be_valid
    end

    it 'is invalid with a negative price_to' do
      search_request.price_to = -1
      expect(search_request).not_to be_valid
    end

    it 'is invalid with a negative year_from' do
      search_request.year_from = -1
      expect(search_request).not_to be_valid
    end

    it 'is invalid with a negative year_to' do
      search_request.year_to = -1
      expect(search_request).not_to be_valid
    end

    it 'is invalid with a negative odometer_from' do
      search_request.odometer_from = -1
      expect(search_request).not_to be_valid
    end

    it 'is invalid with a negative odometer_to' do
      search_request.odometer_to = -1
      expect(search_request).not_to be_valid
    end
  end
end
