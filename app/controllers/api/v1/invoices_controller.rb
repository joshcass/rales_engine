class Api::V1::InvoicesController < ApplicationController
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

  def transactions
    invoice = find_resource
    respond_with invoice.transactions
  end

  def invoice_items
    invoice = find_resource
    respond_with invoice.invoice_items
  end

  def items
    invoice = find_resource
    respond_with invoice.items
  end

  def merchant
    invoice = find_resource
    respond_with invoice.merchant
  end

  def customer
    invoice = find_resource
    respond_with invoice.customer
  end
end
