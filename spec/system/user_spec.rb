# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users' do
  it 'can create a user' do
    user = build(:user)

    expect(User.all.count).to eq(0)

    visit root_path
    click_link 'Sign up'

    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(User.all.count).to eq(1)
  end

  it 'can sign in a user' do
    user = create(:user)

    visit root_path
    click_link 'Log In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
  end

  it 'can sign out a user' do
    user = create(:user)

    login_as user, scope: :user

    visit root_path
    click_button 'Log Out'
    expect(page).to have_link('Log In')
  end
end
