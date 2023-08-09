# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductPolicy, type: :policy do
  it 'allows to edit product by owner' do
    product = create(:product)
    expect(described_class.new(product.user, product).edit?).to be true
  end

  it 'do not allow to edit product by other user' do
    user = create(:user)
    other_user = create(:user)

    product = create(:product, user: user)

    expect(described_class.new(other_user, product).edit?).not_to be true
  end

  it 'allows to update product by owner' do
    product = create(:product)
    expect(described_class.new(product.user, product).update?).to be true
  end

  it 'do not allow to update product by other user' do
    user = create(:user)
    other_user = create(:user)

    product = create(:product, user: user)

    expect(described_class.new(other_user, product).update?).not_to be true
  end

  it 'allows to destroy product by owner' do
    product = create(:product)
    expect(described_class.new(product.user, product).destroy?).to be true
  end

  it 'do not allow to destroy product by other user' do
    user = create(:user)
    other_user = create(:user)

    product = create(:product, user: user)

    expect(described_class.new(other_user, product).destroy?).not_to be true
  end
end
