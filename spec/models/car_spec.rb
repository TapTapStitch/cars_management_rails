# frozen_string_literal: true

RSpec.describe Car do
  subject(:car) do
    described_class.new(make: 'Toyota', model: 'Camry', year: 2021, odometer: 10_000, price: 20_000,
                        description: 'Good condition')
  end

  # Validation tests
  it { should validate_presence_of(:make) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:odometer) }
  it { should validate_presence_of(:price) }

  # Database column tests
  it { should have_db_column(:make).of_type(:string).with_options(null: false) }
  it { should have_db_column(:model).of_type(:string).with_options(null: false) }
  it { should have_db_column(:year).of_type(:integer).with_options(null: false) }
  it { should have_db_column(:odometer).of_type(:integer).with_options(null: false) }
  it { should have_db_column(:price).of_type(:integer).with_options(null: false) }
  it { should have_db_column(:description).of_type(:text) }
end
