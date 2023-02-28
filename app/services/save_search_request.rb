# frozen_string_literal: true

class SaveSearchRequest
  def initialize(search_request, current_user)
    @search_request = search_request
    @user_id = current_user
  end

  def call
    user_search_request = SearchRequest.find_or_initialize_by(request_params(@search_request))
    if user_search_request.persisted?
      user_search_request.update(updated_at: Time.zone.now)
    else
      user_search_request.save
    end
  end

  private

  def request_params(request)
    { make: request.make, model: request.model, price_from: request.price_from, price_to: request.price_to,
      year_from: request.year_from, year_to: request.year_to, odometer_from: request.odometer_from,
      odometer_to: request.odometer_to, user_id: @user_id }
  end
end
