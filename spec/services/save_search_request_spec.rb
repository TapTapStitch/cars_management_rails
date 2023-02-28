# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SaveSearchRequest, type: :service do
  subject(:save_search_request) { described_class.new(search_request, user.id).call }

  let(:user_attributes) { attributes_for(:user) }
  let(:search_request_attributes) { attributes_for(:search_request) }
  let(:user) { create(:user, user_attributes) }
  let(:search_request) { build(:search_request, search_request_attributes) }

  describe '#call' do
    context 'when search request is not persisted' do
      it 'creates a new search request' do
        expect { save_search_request }.to change(SearchRequest, :count).by(1)
      end

      it 'sets user_id to the current user id' do
        save_search_request
        expect(SearchRequest.last.user_id).to eq(user.id)
      end
    end

    context 'when search request is already persisted' do
      let!(:existing_search_request) { create(:search_request, search_request.attributes.merge(user_id: user.id)) }

      it 'does not create a new search request' do
        expect { save_search_request }.not_to change(SearchRequest, :count)
      end

      it 'updates the updated_at timestamp' do
        expect do
          save_search_request
          existing_search_request.reload
        end.to change(existing_search_request, :updated_at)
      end
    end
  end
end
