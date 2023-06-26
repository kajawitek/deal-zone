# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it 'validates the presence of a username' do
    user = build(:user, username: nil)

    expect(user).not_to be_valid
    expect(user.errors.messages[:username]).to include("can't be blank")

    user.username = 'username'
    expect(user).to be_valid
  end

  it 'validates the uniqueness of a username' do
    user = create(:user)

    expect(user).to be_valid

    user2 = build(:user, username: user.username)

    expect(user2).not_to be_valid
    expect(user2.errors.messages[:username]).to include('has already been taken')
  end
end
