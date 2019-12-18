# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'message' do
    it 'it have a order' do
      order = create(:order)
      expect(order.costumer).to be_kind_of(Costumer)
    end

    it 'it have a list of 3 elements' do
      orders = create_list(:order, 3)
      expect(orders.count).to eq(3)
    end

    it 'has many with change quantity of orders' do
      costumer = create(:costumer_with_orders, qtt_orders: 5)
      expect(costumer.orders.count).to eq(5)
    end

    it 'has many' do
      costumer = create(:costumer_with_orders)
      expect(costumer.orders.count).to eq(3)
    end
  end
end
