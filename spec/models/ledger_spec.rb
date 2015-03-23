require 'rails_helper'

describe Ledger do
  it { is_expected.to have_many :remittances}
  it { is_expected.to have_many :exchanges}
end
