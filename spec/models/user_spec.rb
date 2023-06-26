# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it 'validates the presence of a username' do
    user = build(:user, username: nil)
    expect(user).not_to be_valid
  end

  it 'validates the uniqueness of a username' do
    user = create(:user)
    not_valid_user = build(:user, username: user.username)
    expect(not_valid_user).not_to be_valid
  end
end
