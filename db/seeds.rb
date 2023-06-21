# frozen_string_literal: true

Rails.logger.debug 'Creating users'
3.times do |_u|
  user = FactoryBot.create(:user)
  Rails.logger.debug user.email
end
