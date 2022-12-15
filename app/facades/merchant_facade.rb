# frozen_string_literal: true

class MerchantFacade
  def self.find_all_merchants(search)
    json = RailsEngineService.find_all_merchants(search)
    merchants = json[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end

  def self.get_merchant_items(id)
    json = RailsEngineService.get_merchant_items(id)
    items = json[:data].map do |item_data|
      Item.new(item_data)
    end
  end

  def self.get_merchant(id)
    json = RailsEngineService.get_merchant(id)
    merchant = Merchant.new(json[:data])
  end

  def self.get_merchants
    json = RailsEngineService.get_merchants
    merchants = json[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end
end
