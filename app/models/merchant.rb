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
    day = date.to_date
    joins(:invoices).merge(Invoice.successful).where(invoices: {created_at: day.beginning_of_day..day.end_of_day}).includes(:invoice_items).sum("quantity * unit_price") / 100
  end

  def revenue(date = nil)
    if date
      day = date.to_date
      invoices.successful.where(created_at: day.beginning_of_day..day.end_of_day).joins(:invoice_items).sum("quantity * unit_price") /100
    else
      invoices.successful.joins(:invoice_items).sum("quantity * unit_price") / 100
    end
  end

  def favorite_customer
    hash = Hash.new(0)
    customers.map { |c| hash[c] += 1 }
    max_value = hash.values.max
    hash.map { |k, v| k if v == max_value }.compact
  end

  def customers_with_pending_invoices
    (invoices - invoices.successful).map(&:customer).uniq
  end
end
