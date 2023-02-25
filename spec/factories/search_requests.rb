# frozen_string_literal: true

FactoryBot.define do
  factory :search_request do
    user_id { FFaker::Random.rand(1..100) }
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    price_from { rand(10_000) }
    price_to { rand(20_000..30_000) }
    year_from { rand(2000..2010) }
    year_to { rand(2011..2021) }
    odometer_from { rand(5000..10_000) }
    odometer_to { rand(20_000..40_000) }
  end
end
