# frozen_string_literal: true

class RailsEngineService
  def self.get_item(id)
    get_url("/api/v1/items/#{id}")
  end

  def self.get_items
    get_url('/api/v1/items')
  end

  def self.find_all_merchants(search)
    get_url("/api/v1/merchants/find_all?name=#{search}")
  end

  def self.get_merchant_items(id)
    get_url("/api/v1/merchants/#{id}/items")
  end

  def self.get_merchant(id)
    get_url("/api/v1/merchants/#{id}")
  end

  def self.get_merchants
    get_url('/api/v1/merchants')
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://localhost:3000')
  end
end
