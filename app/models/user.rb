# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_products, class_name: 'Product', dependent: :destroy, inverse_of: :buyer
  has_many :bought_products, class_name: 'Product', foreign_key: 'buyer_id', dependent: :destroy, inverse_of: :user

  validates :username, presence: true, uniqueness: true
end
