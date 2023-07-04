# frozen_string_literal: true

Rails.logger.debug 'Creating users'
3.times do |_u|
  user = FactoryBot.create(:user)
  puts "# Creating user #{user.username}"
end

10.times do |_p|
  product = FactoryBot.create(:product)
  puts "# Creating product #{product.name}"
end
