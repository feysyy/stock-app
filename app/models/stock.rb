class Stock < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :symbol, uniqueness: true

  before_commit :save_iex_details, on: [:create]

  def latest_price
    iex_client.quote(symbol).latest_price
  end

  private

  def save_iex_details
    self.company_name = iex_client.company(symbol).company_name
    self.logo = iex_client.logo(symbol).url
  end

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
