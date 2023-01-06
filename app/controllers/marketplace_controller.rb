class MarketplaceController < ApplicationController
  def display
    @list = get_active_stocks
  end

  private

  def get_active_stocks
    Fetcher.get_active_stocks
  end

end