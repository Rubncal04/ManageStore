class Api::V1::ProductsController < Api::ApiController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
  end

  def create
    @product = Product.new product_params
    render json: @product, status: :created if @product.save!

  rescue StandardError => e
    render json: { message: 'Something went wrong', error: e.message }, status: :unprocessable_entity
  end

  def update
    render json: @product, status: :created if @product.update! product_params

  rescue StandardError => e
    render json: { message: 'Something went wrong', error: e.message }, status: :unprocessable_entity
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit :code, :name, :description, :price
  end
end
