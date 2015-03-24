require 'rails_helper'

RSpec.describe LedgersController, :type => :controller do
  let(:ledger) { create :ledger }

  describe "#create" do
    it 'creates new ledger even without arguments' do
      expect {
        post :create
      }.to change { Ledger.count }.by(1)
    end
  end

  describe "#destroy" do
    it 'removes a ledger from a DB' do
      ledger
      expect {
        delete :destroy, id: ledger
      }.to change { Ledger.count }.by(-1)
    end
  end

  describe "#show" do
    it 'is successful call' do
      get :show, id: ledger
      expect(response.code).to eql '200'
    end
  end
end
