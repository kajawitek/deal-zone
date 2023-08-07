# frozen_string_literal: true

class ProductsQuery
  def initialize(products:, params: {})
    @collection = products
    @params = params
  end

  def call
    order_by_created_at
    paginate

    @collection
  end

  private

  def order_by_created_at
    @collection = @collection.order(created_at: :desc)
  end

  def paginate
    @collection = @collection.page(@params[:page])
  end
end
