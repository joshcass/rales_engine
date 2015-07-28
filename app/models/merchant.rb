class Merchant < ActiveRecord::Base
  include Finders

  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
end
