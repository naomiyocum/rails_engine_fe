class MerchantsController < ApplicationController
  def index
    @merchants = MerchantFacade.get_merchants
  end

  def show
    @merchant = MerchantFacade.get_merchant(params[:id])
    @items = MerchantFacade.get_merchant_items(params[:id])
  end
end