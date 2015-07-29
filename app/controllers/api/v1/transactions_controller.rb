class Api::V1::TransactionsController < ApplicationController
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

  def invoice
    transaction = find_resource
    respond_with transaction.invoice
  end
end
