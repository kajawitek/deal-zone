# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    render :index, locals: { products: Product.all }
  end

  def show
    render :show, locals: { product: Product.find(params[:id]) }
  end

  def new
    render :new, locals: { product: Product.new }
  end

  def edit
    render :edit, locals: { product: Product.find(params[:id]) }
  end

  def create
    product = Product.new(product_params)

    if product.save
      redirect_to products_path, notice: 'Product was successfully created.'
    else
      render :new, locals: { product: product }
    end
  end

  def update
    product = Product.find(params[:id])

    if product.update(product_params)
      redirect_to products_path, notice: 'Product was successfully updated.'
    else
      render :edit, locals: { product: product }
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path, notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity)
  end
end
