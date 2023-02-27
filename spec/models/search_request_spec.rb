# frozen_string_literal: true
# rubocop:disable Metrics/BlockLength

RSpec.describe SearchRequest, type: :model do
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
      expect(search_request).to_not be_valid
    end

    it 'is invalid with a negative price_to' do
      search_request.price_to = -1
      expect(search_request).to_not be_valid
    end

    it 'is invalid with a negative year_from' do
      search_request.year_from = -1
      expect(search_request).to_not be_valid
    end

    it 'is invalid with a negative year_to' do
      search_request.year_to = -1
      expect(search_request).to_not be_valid
    end

    it 'is invalid with a negative odometer_from' do
      search_request.odometer_from = -1
      expect(search_request).to_not be_valid
    end

    it 'is invalid with a negative odometer_to' do
      search_request.odometer_to = -1
      expect(search_request).to_not be_valid
    end
  end

  describe 'factories' do
    it 'has a valid search_request factory' do
      expect(build(:search_request)).to be_valid
    end

    it 'can create multiple search_requests using the search_request factory' do
      expect(create_list(:search_request, 3)).to all(be_valid)
    end
  end
end
# rubocop:enable Metrics/BlockLength
