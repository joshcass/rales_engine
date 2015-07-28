class Api::V1::InvoiceItemsController < ApplicationController
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

  def invoice
    invoice_item = find_resource
    respond_with invoice_item.invoice
  end

  def item
    invoice_item = find_resource
    respond_with invoice_item.item
  end
end
