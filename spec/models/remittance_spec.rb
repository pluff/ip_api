require 'rails_helper'

describe Remittance do
  describe "relations and validations" do
    it { is_expected.to validate_presence_of(:currency) }
    it { is_expected.to validate_inclusion_of(:currency).in_array(Currencies::ALL) }
    it { is_expected.to validate_presence_of(:transferred_at) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount) }
  end
end
