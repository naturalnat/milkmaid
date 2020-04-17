class OrdersController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index;
      @orders = Order.all
    end

    def new
      @order = Order.new
    end

    def create
      @order = Order.new(order_params)
      @order.user_id = session[:user_id]
      if @order.save
        redirect_to orders_url
      else
        render :new
      end
    end

    def show

    end

    private

     def order_params
        params.require(:order).permit(:frequency, :size, :milk_id, :name)
      end

end
