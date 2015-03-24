class RemittancesController < ApplicationController

  def create
    if remittance.save
      render json: remittance, status: :created
    else
      render json: remittance, status: :unprocessable_entity
    end
  end

  def update
    if remittance.save
      render json: remittance, status: :ok
    else
      render json: remittance, status: :unprocessable_entity
    end
  end

  def destroy
    if remittance.destroy
      head :ok
    else
      render json: remittance, status: :unprocessable_entity
    end
  end


  private

  def ledger
    Ledger.accessible.find_by!(access_token: params[:ledger_id])
  end

  def remittance
    unless @remittance
      @remittance = ledger.remittances.find_or_initialize_by(id: params[:id])
      @remittance.attributes = remittance_params
    end
    @remittance
  end

  def remittance_params
    params.permit(:currency, :amount, :transferred_at)
  end
end
