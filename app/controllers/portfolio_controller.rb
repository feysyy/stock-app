class PortfolioController < ApplicationController

  def display
    @stocks = current_user.stocks
  end

  def show_stock
    @stock = Stock.find_by(symbol: params[:symbol])
    @order = @stock.orders.new
  end
end