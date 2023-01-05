class Stock < ApplicationRecord
  belongs_to :user

  def latest_price
    iex_client.quote(symbol).latest_price
  end

  private

  # def get_latest_price
  #   unless Rails.cache.fetch(symbol).blank?
  #     response = Rails.cache.fetch(symbol)
  #   else
  #     response = iex_client.quote(symbol).latest_price
  #     Rails.cache.write(symbol, response, expires_in: 1.day) unless response.blank?
  #     puts Rails.cache.fetch(symbol)
  #     puts Rails.cache.fetch(symbol)
  #     puts Rails.cache.fetch(symbol)
  #     puts Rails.cache.fetch(symbol)
  #     puts Rails.cache.fetch(symbol)
  #     puts "xczxcx"
  #     puts symbol
  #     puts symbol
  #     puts symbol

  #   end
  #   response
  # end

  def iex_client
    IEX::Api::Client.new
  end
end
