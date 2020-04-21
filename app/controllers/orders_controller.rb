class OrdersController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
      if @orders = Order.where(user_id: session[:user_id])
        @orders
      else
        @orders = Order.all
    end
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
        flash[:error] = 'Error, please fill in all fields and try again.'
        render :new
      end
    end

    def edit
       @order = Order.find_by_id(params[:id])
    end


    def update
      @order = Order.find_by_id(params[:id])
      if @order.update_attributes(order_params) 
        redirect_to orders_path
      else
        flash[:error] = 'Error, please try again.'
        render :edit
      end
    end

    def destroy
      selected_order
      @order.destroy
      redirect_to orders_path
    end

    def show
      @order = Order.find_by_id(params[:id])
      @milk = Milk.find_by_id(@order.milk_id)
    end

    private

     def order_params
        params.require(:order).permit(:frequency, :size, :milk_id, :name)
      end

      def selected_order
        @order = Order.find_by(params[:id])
        redirect_to orders_path if !@order
      end
end
