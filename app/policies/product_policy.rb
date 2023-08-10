# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  def update?
    user == record.user
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
