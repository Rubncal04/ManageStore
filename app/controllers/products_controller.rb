class ProductsController < ApplicationController
  def index
    @products = Product.all()
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

  private

  def product_params
    params.require(:product).permit :code, :name, :description, :main_stotage, :current_storage, :price
  end
end
