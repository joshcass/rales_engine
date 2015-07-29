class Customer < ActiveRecord::Base
  include Finders

  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    name_pair = invoices.successful.joins(:merchant).group(:name).count.max_by{ |_, v| v }
    if name_pair
      merchants.find_by(name: name_pair.first)
    end
  end
end
