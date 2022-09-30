class ProductsController < ApplicationController
  before_action :set_image, only: [:edit, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create product_params
    if @product.save
        redirect_to products_path
    else
        render :new, status: :bad_request
    end
  end

  def edit
  end

  def update
    if @product.update product_params
      redirect_to @product
    else
      flash.alert = "Something was wrong. Please, verify the information"
    end
  end

  def show
    
  end

  private

  def set_image
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit :code, :name, :description, :main_storage, :current_storage, :price
  end
end
