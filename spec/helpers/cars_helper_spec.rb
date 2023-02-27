# frozen_string_literal: true

RSpec.describe CarsHelper do
  describe '#sort_link' do
    it 'returns a link with the given title' do
      sort_order = 'date_added_asc'
      title = 'Sort by Make'
      link = helper.sort_link(sort_order, title)

      expect(link).to include(title)
    end

    it 'appends the sort order to the URL' do
      sort_order = 'price_desc'
      title = 'Sort by Model'
      link = helper.sort_link(sort_order, title)

      expect(link).to include("sort=#{sort_order}")
    end
  end
end
