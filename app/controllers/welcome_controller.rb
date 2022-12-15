# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    if params[:search] && params[:search] == ''
      flash[:error] = 'Text field must be filled in'
      render :index
    elsif params[:search]
      @search = params[:search]
      @merchants = MerchantFacade.find_all_merchants(params[:search])
    end
  end
end
