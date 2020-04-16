class OrdersController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index; end
    
    def new
      @order = Order.new
      @order.build_user
    end

    def create
      @order = Order.new(order_params)
      if @order.save
        session[:user_id] = @user.id
        redirect_to order_path(@order)
      else
        render :new
      end
    end

    private

     def order_params
        params.require(:order).permit(:frequency, :size, milk_attributes: [:milktype])
      end

end
