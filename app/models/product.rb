# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user

  validates :name, :description, :price, :quantity, presence: true
end
