class LedgersController < ApplicationController

  def create
    if ledger.save
      render json: ledger, status: :created
    else
      render json: ledger, status: :unprocessable_entity
    end
  end

  def update
    if ledger.save
      render json: ledger, status: :ok
    else
      render json: ledger, status: :unprocessable_entity
    end
  end

  def destroy
    if ledger.destroy
      head :ok
    else
      render json: ledger, status: :unprocessable_entity
    end
  end

  def show
    render json: ledger
  end

  private

  def ledger
    unless @ledger
      @ledger = if params[:id].present?
                  Ledger.accessible.find_by!(access_token: params[:id])
                else
                  Ledger.new
                end
      @ledger.attributes = ledger_params
    end
    @ledger
  end

  def ledger_params
    {}
  end
end
