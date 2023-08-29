# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :buyer, class_name: 'User'
  belongs_to :product

  validates :purchase_price, :delivery_status, presence: true
end
