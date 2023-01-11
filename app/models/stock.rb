class Stock < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :symbol, uniqueness: true

  before_commit :save_iex_details, on: [:create]

  def latest_price
    Fetcher.get_latest_price(acronym: symbol)
  end

  def user
    User.find(user_id)
  end

  private

  def save_iex_details
    self.company_name = iex_client.company(symbol).company_name
    self.logo = iex_client.logo(symbol).url
  end

  def iex_client
    IEX::Api::Client.new
  end
end
