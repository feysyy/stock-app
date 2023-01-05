class PortfolioController < ApplicationController

  def display
    @stocks = current_user.stocks
  end
end