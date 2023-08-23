# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user
  belongs_to :buyer, class_name: 'User', optional: true

  validates :name, :description, :price, :quantity, presence: true
end
