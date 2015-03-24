require 'rails_helper'

RSpec.describe ExchangesController, :type => :controller do
  let(:ledger) { create :ledger }
  let(:exchange) { create :exchange, ledger: ledger }

  before { ledger }

  describe "#create" do
    it 'creates exchange' do
      expect {
        post :create, attributes_for(:exchange).merge(ledger_id: ledger)
      }.to change { ledger.exchanges.count }.by(1)
    end
  end

  describe "#update" do
    it 'updates exchange' do
      exchange
      expect {
        patch :update, {amount: exchange.amount + 10}.merge(ledger_id: ledger, id: exchange)
        exchange.reload
      }.to change { exchange.amount }.by(10)
    end
  end

  describe "#destroy" do
    it 'removes exchange' do
      exchange
      expect {
        delete :destroy, ledger_id: ledger, id: exchange
      }.to change { ledger.exchanges.count }.by(-1)
    end
  end
end
