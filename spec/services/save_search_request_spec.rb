# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SaveSearchRequest, type: :service do
  let(:user) { create(:user) }
  let(:search_request) { build(:search_request) }
  let(:save_search_request) { described_class.new(search_request, user.id) }

  describe '#call' do
    context 'when search request is not persisted' do
      it 'creates a new search request' do
        expect { save_search_request.call }.to change(SearchRequest, :count).by(1)
      end

      it 'sets user_id to the current user id' do
        save_search_request.call
        expect(SearchRequest.last.user_id).to eq(user.id)
      end
    end

    context 'when search request is already persisted' do
      let!(:existing_search_request) { create(:search_request, request_params(search_request).merge(user_id: user.id)) }

      it 'does not create a new search request' do
        expect { save_search_request.call }.not_to change(SearchRequest, :count)
      end

      it 'updates the updated_at timestamp' do
        expect do
          save_search_request.call
          existing_search_request.reload
        end.to change(existing_search_request, :updated_at)
      end
    end
  end

  private

  def request_params(request)
    { make: request.make, model: request.model, price_from: request.price_from, price_to: request.price_to,
      year_from: request.year_from, year_to: request.year_to, odometer_from: request.odometer_from,
      odometer_to: request.odometer_to }
  end
end
