require 'csv'

task csv: :environment do
  desc "parse csv file to get AR data"

  csv_text = File.read('./lib/assets/customers.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Customer.create(row.to_h)
  end

  csv_text = File.read('./lib/assets/merchants.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Merchant.create(row.to_h)
  end

  csv_text = File.read('./lib/assets/items.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Item.create(row.to_h)
  end

  csv_text = File.read('./lib/assets/invoices.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Invoice.create(row.to_h)
  end

  csv_text = File.read('./lib/assets/invoice_items.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    InvoiceItem.create(row.to_h)
  end

  csv_text = File.read('./lib/assets/transactions.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Transaction.create(row.to_h.except("credit_card_expiration_date"))
  end
end
