class Api::V1::ItemsController < ApplicationController
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

  def invoice_items
    item = find_resource
    respond_with item.invoice_items
  end

  def merchant
    item = find_resource
    respond_with item.merchant
  end

  def most_revenue
    respond_with Item.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Item.most_items(params[:quantity])
  end

  def best_day
    item = find_resource
    respond_with item.best_day
  end
end
