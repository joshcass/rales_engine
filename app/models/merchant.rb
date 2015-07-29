class Merchant < ActiveRecord::Base
  include Finders

  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  def total_revenue
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price")
  end

  def total_items
    invoices.successful.joins(:invoice_items).sum(:quantity)
  end

  def self.most_revenue(quantity)
    all.sort_by { |m| m.total_revenue }.last(quantity.to_i).reverse
  end

  def self.most_items(quantity)
    all.sort_by { |m| m.total_items }.last(quantity.to_i).reverse
  end

  def self.revenue_for_date(date)
    joins(:invoices).where(invoices: {created_at: date}).merge(Invoice.successful).includes(:invoice_items).sum("quantity * unit_price")
  end

  def revenue(date = nil)
    if date
      invoices.successful.where(created_at: date).joins(:invoice_items).sum("quantity * unit_price").to_f
    else
      invoices.successful.joins(:invoice_items).sum("quantity * unit_price")
    end
  end

  def favorite_customer
    hash = Hash.new(0)
    customers.map { |c| hash[c] += 1 }
    max_value = hash.values.max
    hash.map { |k, v| k if v == max_value }.compact
  end

  def customers_with_pending_invoices

  end
end
