class Fetcher
  class << self

    def get_active_stocks
      key = "mostactive".freeze

      if Rails.cache.exist?(key)
        puts "most active is cached"
        return Rails.cache.read(key)
      end

      list = iex_client.stock_market_list(:mostactive)
      Rails.cache.write(key, list, expires_in: 1.day) unless list.blank?
      list
    end

    def get_latest_price(acronym:)
      if Rails.cache.exist?(acronym)
        puts "#{acronym} latest price is cached"
        return Rails.cache.read(acronym)
      end

      price = iex_client.quote(acronym).latest_price
      Rails.cache.write(acronym, price, expires_in: 1.day) unless price.blank?
      price
    end

    private

    def iex_client
      IEX::Api::Client.new
    end

  end
end