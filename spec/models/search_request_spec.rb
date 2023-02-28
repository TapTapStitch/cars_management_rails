# frozen_string_literal: true

RSpec.describe SearchRequest do
  # Association tests
  it { should belong_to(:user).optional }

  # Validation tests
  it { should validate_numericality_of(:price_from).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:price_to).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:year_from).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:year_to).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:odometer_from).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:odometer_to).is_greater_than_or_equal_to(0).allow_nil }

  # Database column tests
  it { should have_db_column(:user_id).of_type(:integer).with_options(null: false) }
  it { should have_db_column(:make).of_type(:string) }
  it { should have_db_column(:model).of_type(:string) }
  it { should have_db_column(:year_from).of_type(:integer) }
  it { should have_db_column(:year_to).of_type(:integer) }
  it { should have_db_column(:odometer_from).of_type(:integer) }
  it { should have_db_column(:odometer_to).of_type(:integer) }
  it { should have_db_column(:price_from).of_type(:integer) }
  it { should have_db_column(:price_to).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
  it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
end
