# frozen_string_literal: true

puts 'Creating users'
(1..5).each do |_i|
  User.create!(email: Faker::Internet.email, password: 'password')
end
