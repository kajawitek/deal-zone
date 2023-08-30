# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :name, :description, :price, :quantity, presence: true
end
