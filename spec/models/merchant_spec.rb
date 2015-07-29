require 'rails_helper'

describe Merchant, type: :model do
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

  let(:item_attributes) do
    {name: "Item Fuga Est",
     description: "Vitae nostrum esse sequi reprehenderit error sint ...",
     unit_price: 10,
     created_at: "2012-03-27 14:54:09",
     updated_at: "2012-03-27 14:54:09",
     merchant_id: merchant.id
    }
  end

  let(:invoice)  { Invoice.create(invoice_attributes)  }
  let(:customer) { Customer.create(customer_attributes)}
  let(:merchant) { Merchant.create(merchant_attributes)}
  let(:item)     { Item.create(item_attributes)        }

  it 'responds to invoices' do
    expect(merchant).to respond_to(:invoices)
  end

  it 'responds to items' do
    expect(merchant).to respond_to(:items)
  end

  it 'should have many invoices' do
    expect(merchant.invoices.include?(invoice)).to be(true)
    expect(merchant.invoices.count).to eq(1)
  end

  it 'should have many items' do
    expect(merchant.items.include?(item)).to be(true)
    expect(merchant.items.count).to be(1)
  end
end

