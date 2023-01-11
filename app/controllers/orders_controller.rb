class OrdersController < ApplicationController
  before_action :get_stock
  def create
    order = @stock.orders.build(order_params)
    order.update(stock_id: @stock.id, user_id: current_user.id)

    if order.save
      redirect_to show_stock_path(symbol: @stock.symbol), notice: "Success"
    else
      redirect_to show_stock_path(symbol: @stock.symbol), alert: "#{order.errors.first.message}"
    end
  end

  private

  def get_stock
    @stock = Stock.find(params[:stock_id])
  end

  def order_params
    params.require(:order).permit(:stock_id, :order_type, :user_id, :quantity)
  end

end