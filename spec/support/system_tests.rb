# frozen_string_literal: true

RSpec.configure do |c|
  c.before(:each, type: :system) do
    driven_by :rack_test
  end

  c.before(:each, js: true, type: :system) do
    driven_by :chrome_headless
  end
end
