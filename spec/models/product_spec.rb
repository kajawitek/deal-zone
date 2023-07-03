# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product do
  it 'validates the presence of a name' do
    product = build(:product, name: nil)
    expect(product).not_to be_valid
  end

  it 'validates the presence of a description' do
    product = build(:product, description: nil)
    expect(product).not_to be_valid
  end

  it 'validates the presence of a price' do
    product = build(:product, price: nil)
    expect(product).not_to be_valid
  end

  it 'validates the presence of a quantity' do
    product = build(:product, quantity: nil)
    expect(product).not_to be_valid
  end
end
