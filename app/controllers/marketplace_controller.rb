class MarketplaceController < ApplicationController
  def display
    @list = get_active_stocks
    @users = User.all
    @stocks = Stock.all
  end

  private

  def get_active_stocks
    iex_client.stock_market_list(:mostactive)
  end

  def iex_client
    IEX::Api::Client.new
  end

end