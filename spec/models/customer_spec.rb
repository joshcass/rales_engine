require 'rails_helper'

describe Customer, type: :model do
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

  let(:invoice)  { Invoice.create(invoice_attributes)  }
  let(:invoice2) { Invoice.create(invoice_attributes)  }
  let(:customer) { Customer.create(customer_attributes)}
  let(:merchant) { Merchant.create(merchant_attributes)}

  it 'responds to invoices' do
    expect(customer).to respond_to(:invoices)
  end

  it 'responds to transactions' do
    expect(customer).to respond_to(:transactions)
  end

  it 'should have many invoices' do
    expect(customer.invoices.include?(invoice)).to be(true)
    expect(customer.invoices.count).to eq(1)
  end

  it 'should have many transactions' do
    transaction = Transaction.create({invoice_id: invoice.id,
                                      credit_card_number: "4397199533314394",
                                      result: "success",
                                      created_at: "2012-03-27 14:58:15",
                                      updated_at: "2012-03-27 14:58:15"})
    expect(customer.transactions.include?(transaction)).to be(true)
    expect(customer.transactions.count).to be(1)
  end
end
