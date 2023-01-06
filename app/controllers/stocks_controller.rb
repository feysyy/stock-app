class StocksController < ApplicationController
  def create
    stock = current_user.stocks.create(symbol: params[:symbol])
    # stock = current_user.stocks.new(stock_params)
    # stock.update(user_id: current_user.id)

    if stock.save
      redirect_to marketplace_display_path, notice: "Successfully added"
    else
      redirect_to marketplace_display_path, alert: "Something went wrong"
    end
  end

  # private

  # def stock_params
  #   params.require(:stock).permit(:symbol)
  # end

end