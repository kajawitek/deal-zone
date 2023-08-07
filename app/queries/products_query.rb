# frozen_string_literal: true

class ProductsQuery
  def initialize(products:, params: {})
    @products = products
    @params = params
  end

  def call
    initialize_collection
    order_by_created_at
    paginate

    @collection
  end

  private

  def initialize_collection
    @collection = @products
  end

  def order_by_created_at
    @collection = @collection.order(created_at: :desc)
  end

  def paginate
    @collection = @collection.page(@params[:page])
  end
end
