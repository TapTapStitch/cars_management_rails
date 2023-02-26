# frozen_string_literal: true

require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe CarsHelper, type: :helper do
  describe '#sort_link' do
    let(:sort_order) { 'make_desc' }
    let(:title) { 'Some Title' }
    let(:params) do
      {
        make: 'Audi',
        model: 'A4',
        year_from: FFaker::Vehicle.year,
        year_to: FFaker::Vehicle.year,
        price_from: FFaker::Random.rand(5000..10_000),
        price_to: FFaker::Random.rand(10_001..20_000),
        odometer_from: FFaker::Random.rand(10_000..50_000),
        odometer_to: FFaker::Random.rand(50_001..100_000),
        page: FFaker::Random.rand(1..10)
      }
    end

    subject(:sort_link) { helper.sort_link(sort_order, title) }

    before do
      allow(helper).to receive(:params).and_return(params)
    end

    it 'returns a link with the correct sort order and parameters' do
      expect(sort_link).to include("sort=#{sort_order}")
      expect(sort_link).to include("make=#{params[:make]}")
      expect(sort_link).to include("model=#{params[:model]}")
      expect(sort_link).to include("year_from=#{params[:year_from]}")
      expect(sort_link).to include("year_to=#{params[:year_to]}")
      expect(sort_link).to include("price_from=#{params[:price_from]}")
      expect(sort_link).to include("price_to=#{params[:price_to]}")
      expect(sort_link).to include("odometer_from=#{params[:odometer_from]}")
      expect(sort_link).to include("odometer_to=#{params[:odometer_to]}")
      expect(sort_link).to include("page=#{params[:page]}")
    end
  end
end
# rubocop:enable Metrics/BlockLength
