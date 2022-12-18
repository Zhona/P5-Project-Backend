class OrdersController < ApplicationController
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
#can you create orders?
    def index 
        orders = Order.all
        render json: orders
    end 

    def show 
        order = find_order 
        render json: order 
    end 

    # def create 
    #     order = Order.create!(order_params)
    #     render json: order, status: :created
    # end 

    # def destroy 
    #     order = find_order
    #     order.destroy
    #     head :no_content
    # end 

    private

    def find_order 
        Order.find(params[:id])
    end 

    def order_params
        params.permit(:address, :apartment, :user_id, :phoneNumber, :subtotal, :shipping_rate, :taxes, :total)
    end

    def record_not_found 
        render json: {error: "Order not found"}, status: :not_found
    end 

    # def render_unprocessable_entity (invalid)
    #     render json: {errors: invalid.record.errors.full_messages}, status: :render_unprocessable_entity
    # end 
end
