# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :buyer
  belongs_to :product
end
