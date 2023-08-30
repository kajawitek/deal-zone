# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    orders = Order.where(buyer: current_user).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    render :index, locals: { orders: orders }
  end

  def new
    product = Product.find(params[:product])
    order = Order.new(product: product)
    render :new, locals: { order: order }
  rescue ActiveRecord::RecordNotFound => e
    redirect_to products_path, notice: e.message
  end

  def create
    product = Product.find(order_params[:product_id])
    order = Order.new(product: product, buyer_id: current_user.id, purchase_price: product.price)
    if product.quantity.positive?
      begin
        ActiveRecord::Base.transaction do
          product.decrement!(:quantity)
          order.save!
        end
        redirect_to orders_path, notice: 'Order was successfully created.'
      rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound => e
        render :new, locals: { order: order }, notice: e.message
      end
    else
      render :new, locals: { order: order }, notice: 'Product is out of stock.'
    end
  end

  private

  def order_params
    params.require(:order).permit(:product_id)
  end
end
