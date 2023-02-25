# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    year { rand(2000..2022) }
    odometer { rand(1000..100_000) }
    price { rand(1000..50_000) }
    description { FFaker::Lorem.paragraph }
  end
end
