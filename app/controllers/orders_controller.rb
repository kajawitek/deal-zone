# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    render :index, locals: { orders: Order.all.where(buyer: current_user) }
  end

  def new
    begin
      product = Product.find(params[:product])
      order = Order.new(product: product)
      render :new, locals: { order: order }
    rescue ActiveRecord::RecordNotFound => e
      flash[:notice] = 'Product not found'
      redirect_to products_path, notice: e.message
    end
  end

  def create
    product = Product.find(order_params[:product_id])
    order = Order.new(product: product)
    order.buyer_id = current_user.id
    order.purchase_price = product.price
    if product.quantity > 0
      begin
        ActiveRecord::Base.transaction do
          product.quantity -= 1
          product.save!
          order.save!
        end
        redirect_to orders_path, notice: 'Order was successfully created.'
      rescue ActiveRecord::RecordInvalid => e
        render :new, locals: { order: order }, notice: e.message
      end
    else
      render :new, locals: { order: order }, notice: 'Product is out of stock.'
    end
  end

  private

  def order
    @order ||= Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:product_id)
  end
end
