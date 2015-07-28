class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def random
    respond_with find_random
  end

  def show
    respond_with find_resource
  end

  def find
    respond_with find_resource
  end

  def find_all
    respond_with find_resources
  end

  def items
    merchant = find_resource
    respond_with merchant.items
  end

  def invoices
    merchant = find_resource
    respond_with merchant.invoices
  end
end
