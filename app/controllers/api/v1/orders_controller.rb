class Api::V1::OrdersController < Api::ApiController
  before_action :set_order, only: [:show]

  def index
    @orders = Order.all
  end

  def create
    @order = product.orders.new order_params

    render json: @order, status: :created if @order.save!

  rescue StandardError => e
    render json: { message: 'Something went wrong', error: e.message }, status: :unprocessable_entity
  end

  private

  def product
    Product.find(params[:product_id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit :product_id, :quantity, :order_type
  end
end
