FactoryBot.define do
  factory :search_request do
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    price_from { rand(10000) }
    price_to { rand(20000..30000) }
    year_from { rand(2000..2010) }
    year_to { rand(2011..2021) }
    odometer_from { rand(5000..10000) }
    odometer_to { rand(20000..40000) }
  end
end
