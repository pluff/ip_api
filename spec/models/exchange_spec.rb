require 'rails_helper'

describe Exchange do
  describe "relations and validations" do
    it { is_expected.to validate_presence_of(:from_currency) }
    it { is_expected.to validate_inclusion_of(:from_currency).in_array(Currencies::ALL) }
    it { is_expected.to validate_presence_of(:to_currency) }
    it { is_expected.to validate_inclusion_of(:to_currency).in_array(Currencies::ALL) }
    it { is_expected.to validate_presence_of(:transferred_at) }
    it { is_expected.to validate_presence_of(:exchange_rate) }
    it { is_expected.to validate_numericality_of(:exchange_rate) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount) }
  end
end
