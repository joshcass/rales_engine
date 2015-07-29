class Api::V1::MerchantsController < ApplicationController
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

  def items
    merchant = find_resource
    respond_with merchant.items
  end

  def invoices
    merchant = find_resource
    respond_with merchant.invoices
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Merchant.most_items(params[:quantity])
  end

  def revenue
    if params[:id]
      merchant = find_resource
      respond_with merchant.revenue(params[:date])
    else
      respond_with Merchant.revenue_for_date(params[:date])
    end
  end

  def favorite_customer
    merchant = find_resource
    respond_with merchant.favorite_customer
  end

  def customers_with_pending_invoices
    merchant = find_resource
    respond_with merchant.customers_with_pending_invoices
  end
end
