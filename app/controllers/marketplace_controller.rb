class MarketplaceController < ApplicationController
  before_action :redirect_user_if_unauthorized

  def display
    @list = get_active_stocks
  end

  private

  def get_active_stocks
    Fetcher.get_active_stocks
  end

  def redirect_user_if_unauthorized
    unless current_user.approved?
      redirect_to root_path, alert: "Sorry you are not yet approved"
    end
  end

end