require './spec/spec_helper'

RSpec.describe Distance, type: :model do
  it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:origin).of_type(:string) }
  it { is_expected.to have_db_column(:destination).of_type(:string) }
  it { is_expected.to have_db_column(:kilometers).of_type(:integer) }
  it { is_expected.to validate_length_of(:origin).is_at_least(1) }
  it { is_expected.to validate_length_of(:destination).is_at_least(1) }
  it { is_expected.to validate_numericality_of(:kilometers).is_greater_than(0) }
  it { is_expected.to validate_numericality_of(:kilometers).is_less_than_or_equal_to(100000) }
end
