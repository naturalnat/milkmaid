# frozen_string_literal: true

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
   @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to orders_url
    else
      flash[:error] = 'Error, please fill in all fields and try again.'
      render :new
    end
  end

  def edit
    selected_order(params[:id])
  end

  def update
    selected_order(params[:id])
    if @order.update_attributes(order_params)
      redirect_to orders_path
    else
      flash[:error] = 'Error, please try again.'
      render :edit
    end
  end

  def destroy
    selected_order(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  def show
    selected_order(params[:id])
    @milk = Milk.find_by_id(@order.milk_id)
  end

  private

  def order_params
    params.require(:order).permit(:frequency, :size, :milk_id, :name)
   end

  def selected_order(id)
    @order = Order.find_by_id(id)
    @order
  end
end
