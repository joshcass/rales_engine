require 'rails_helper'

describe InvoiceItem, type: :model do
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

  let(:invoice_item_attributes) do
    {item_id: item.id,
     invoice_id: invoice.id,
     quantity: 5,
     unit_price: 10,
     created_at: "2012-03-27 14:58:15",
     updated_at: "2012-03-27 14:58:15"}
  end


  let(:invoice)  { Invoice.create(invoice_attributes)  }
  let(:customer) { Customer.create(customer_attributes)}
  let(:merchant) { Merchant.create(merchant_attributes)}
  let(:item)     { Item.create(item_attributes)        }
  let(:invoice_item) { InvoiceItem.create(invoice_item_attributes)}

  it 'responds to invoice' do
    expect(invoice_item).to respond_to(:invoice)
  end

  it 'responds to item' do
    expect(invoice_item).to respond_to(:item)
  end

  it 'should have an invoice' do
    expect(invoice_item.invoice).to eq(invoice)
  end

  it 'should have an item' do
    expect(invoice_item.item).to eq(item)
  end
end
