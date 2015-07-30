class Customer < ActiveRecord::Base
  include Finders

  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  scope :all_transactions, -> { joins(:transactions) }

  def favorite_merchant
    fav_merch = invoices.successful.joins(:merchant).group(:name).count.max_by{ |_, v| v }
    merchants.find_by(name: fav_merch.first) if fav_merch
  end
end
