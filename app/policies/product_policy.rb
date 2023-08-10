# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def update?
    user == product.user
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
