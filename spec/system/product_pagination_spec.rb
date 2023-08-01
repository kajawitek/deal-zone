# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products pagination' do
  it 'shows first product on the first page and last on second page' do
    user = create(:user)

    16.times do |p|
      create(:product, name: "P#{p + 1} Product")
    end

    login_as user, scope: :user

    visit root_path
    click_link 'Products'

    expect(page).to have_content('P16 Product')
    expect(page).to have_content('P2 Product')
    expect(page).not_to have_content('P1 Product')

    click_link 'Older'

    expect(page).not_to have_content('P2 Product')
    expect(page).to have_content('P1 Product')
  end
end
