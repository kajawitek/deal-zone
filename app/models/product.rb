# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :description, :price, :quantity, presence: true
end
