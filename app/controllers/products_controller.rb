# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    render :index, locals: { products: ProductsQuery.new(products: Product.all, params: params).call }
  end

  def show
    render :show, locals: { product: product }
  end

  def new
    render :new, locals: { product: Product.new }
  end

  def edit
    authorize product
    render :edit, locals: { product: product }
  end

  def create
    product = Product.new(product_params)
    product.user_id = current_user.id

    if product.save
      redirect_to products_path, notice: 'Product was successfully created.'
    else
      render :new, locals: { product: product }
    end
  end

  def update
    authorize product
    if product.update(product_params)
      redirect_to products_path, notice: 'Product was successfully updated.'
    else
      render :edit, locals: { product: product }
    end
  end

  def destroy
    authorize product
    product.destroy
    redirect_to products_path, notice: 'Product was successfully destroyed.'
  end

  private

  def product
    @product ||= Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :user_id)
  end
end
