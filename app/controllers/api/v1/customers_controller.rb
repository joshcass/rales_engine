class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with show_all
  end

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

  def invoices
    customer = find_resource
    respond_with customer.invoices
  end

  def transactions
    customer = find_resource
    respond_with customer.transactions
  end

  def favorite_merchant
    customer = find_resource
    respond_with customer.favorite_merchant
  end
end
