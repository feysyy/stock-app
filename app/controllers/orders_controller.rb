class OrdersController < ApplicationController
  def create
    stock = Stock.find(params[:stock_id])
    order = stock.orders.create(order_params)

    if order.save
      redirect_to show_stock_path(symbol: stock.symbol), notice: "Success"
    else
      redirect_to show_stock_path(symbol: stock.symbol), alert: "Failed"
    end
  end

  private

  def order_params
    params.require(:order).permit(:stock_id, :user_id, :quantity)
  end

end