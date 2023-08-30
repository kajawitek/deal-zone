# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products' do
  it 'user can create a product' do
    user = create(:user)
    product = build(:product, user: user)

    login_as user, scope: :user

    visit root_path
    click_link 'Products'

    click_link 'Add product'

    fill_in 'product_name', with: product.name
    fill_in 'product_description', with: product.description
    fill_in 'product_price', with: product.price
    fill_in 'product_quantity', with: product.quantity

    click_button 'Create Product'

    expect(page).to have_content('Product was successfully created.')
  end

  it 'user can edit a product' do
    user = create(:user)
    product = create(:product, user: user)

    login_as user, scope: :user

    visit root_path
    click_link 'Products'
    click_link product.name.to_s
    click_button 'Edit'

    fill_in 'product_name', with: 'New Name'

    click_button 'Update Product'

    expect(page).to have_content('Product was successfully updated.')
    expect(page).to have_content('New Name')
  end

  it 'user can delete a product' do
    user = create(:user)
    product = create(:product, user: user)

    login_as user, scope: :user

    visit root_path
    click_link 'Products'
    click_link product.name.to_s
    click_button 'Destroy'

    expect(page).to have_content('Product was successfully destroyed.')
    expect(page).not_to have_content(product.name.to_s)
  end

  it 'user can view a product' do
    user = create(:user)
    product = create(:product, user: user)

    login_as user, scope: :user

    visit root_path
    click_link 'Products'
    click_link product.name.to_s

    expect(page).to have_content(product.name.to_s)
    expect(page).to have_content(product.description.to_s)
    expect(page).to have_content(product.price.to_s)
    expect(page).to have_content(product.quantity.to_s)
  end
end
