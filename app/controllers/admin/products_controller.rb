class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new product_params
    if product.save
      redirect_to admin_products_path
    else
      redirect_to :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    product = Product.find params[:id]
    product.destroy
    redirect_to admin_products_path
  end


  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :repertory)
  end
end
