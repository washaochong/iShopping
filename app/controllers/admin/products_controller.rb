class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new product_params
    if product.save
      redirect_to admin_products_path
      flash.notice = "添加成功"
    else
      redirect_to :new
    end
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    if @product.update product_params
      redirect_to admin_products_path
      flash[:notice] = "更新成功"
    else
      render :edit
    end
  end

  def destroy
    product = Product.find params[:id]
    product.destroy
    redirect_to admin_products_path
    flash[:alert] = "已删除"
  end

  def require_is_admin
    if current_user.is_admin?
      # redirect_to products_path
      flash.alert = "您没有权限"
    end
  end


  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :repertory, :avatar)
  end
end
