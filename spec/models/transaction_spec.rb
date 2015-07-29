require 'rails_helper'

describe Transaction, type: :model do
  let(:customer_attributes) do
    {first_name: "Lev",
     last_name: "Kravinsky",
     created_at: "2012-03-23 02:58:15",
     updated_at: "2012-03-23 02:58:15"}
  end

  let(:merchant_attributes) do
    {name: "Wisozk, Hoeger and Bosco",
     created_at: "2012-03-27 14:54:09",
     updated_at: "2012-03-27 14:54:09"}
  end

  let(:invoice_attributes) do
    {customer_id: customer.id,
     merchant_id: merchant.id,
     status: "shipped",
     created_at: "2012-03-23 02:58:15",
     updated_at: "2012-03-23 02:58:15"}
  end

  let(:transaction_attributes) do
    {invoice_id: invoice.id,
     credit_card_number: "4397199533314394",
     result: "success",
     created_at: "2012-03-27 14:58:15",
     updated_at: "2012-03-27 14:58:15"}
  end

  let(:invoice)     { Invoice.create(invoice_attributes)        }
  let(:customer)    { Customer.create(customer_attributes)      }
  let(:merchant)    { Merchant.create(merchant_attributes)      }
  let(:transaction) { Transaction.create(transaction_attributes)}

  it 'responds to invoice' do
    expect(transaction).to respond_to(:invoice)
  end

  it 'has an invoice' do
    expect(transaction.invoice).to eq(invoice)
  end
end

