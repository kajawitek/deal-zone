# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :buyer
  belongs_to :products

  validates :name, :description, :price, :quantity, presence: true
end
