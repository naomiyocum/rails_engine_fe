# frozen_string_literal: true

class MerchantsController < ApplicationController
  before_action :find_merchants, only: %i[index]

  def index; end

  def show
    @merchant = MerchantFacade.get_merchant(params[:id])
    @items = MerchantFacade.get_merchant_items(params[:id])
  end

  private

  def find_merchants
    @merchants = MerchantFacade.get_merchants
  end
end
