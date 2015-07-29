class Invoice < ActiveRecord::Base
  include Finders

  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  scope :successful, -> { joins(:transactions).where(transactions: {result: 'success'}) }
  scope :failed, -> { joins(:transactions).where(transactions: {result: 'failed'})}
end
