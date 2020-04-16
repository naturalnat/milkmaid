class OrdersController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
      @order = Order.new
      @order.build_user
    end

    def create
      @order = Order.new(order_params)
      if @order.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
    end

    private

     def order_params
        params.require(:order).permit(:frequency, :size, milk: [:milktype])
      end

end
