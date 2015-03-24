class ExchangesController < ApplicationController

  def create
    if exchange.save
      render json: exchange, status: :created
    else
      render json: exchange, status: :unprocessable_entity
    end
  end

  def update
    if exchange.save
      render json: exchange, status: :ok
    else
      render json: exchange, status: :unprocessable_entity
    end
  end

  def destroy
    if exchange.destroy
      head :ok
    else
      render json: exchange, status: :unprocessable_entity
    end
  end

  private

  def ledger
    Ledger.accessible.find_by!(access_token: params[:ledger_id])
  end

  def exchange
    unless @exchange
      @exchange = ledger.exchanges.find_or_initialize_by(id: params[:id])
      @exchange.attributes = exchange_params
    end
    @exchange
  end

  def exchange_params
    params.permit(:from_currency, :to_currency, :amount, :exchange_rate, :transferred_at)
  end
end
