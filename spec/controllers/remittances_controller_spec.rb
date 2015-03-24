require 'rails_helper'

RSpec.describe RemittancesController, :type => :controller do
  let(:ledger) { create :ledger }
  let(:remittance) { create :remittance, ledger: ledger }

  before { ledger }

  describe "#create" do
    it 'creates remittance' do
      expect {
        post :create, attributes_for(:remittance).merge(ledger_id: ledger)
      }.to change { ledger.remittances.count }.by(1)
    end
  end

  describe "#update" do
    it 'updates remittance' do
      remittance
      expect {
        patch :update, {amount: remittance.amount + 10}.merge(ledger_id: ledger, id: remittance)
        remittance.reload
      }.to change { remittance.amount }.by(10)
    end
  end

  describe "#destroy" do
    it 'removes remittance' do
      remittance
      expect {
        delete :destroy, ledger_id: ledger, id: remittance
      }.to change { ledger.remittances.count }.by(-1)
    end
  end

end
