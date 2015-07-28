class Transaction < ActiveRecord::Base
  include Finders

  belongs_to :invoice
  has_one :merchant, through: :invoice
end
