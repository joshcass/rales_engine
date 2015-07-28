class InvoiceItem < ActiveRecord::Base
  include Finders

  belongs_to :invoice
  belongs_to :item

 end
