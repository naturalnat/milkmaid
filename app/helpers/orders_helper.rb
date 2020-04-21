module OrdersHelper

  def frequency_options
    ["weekly", "bi-weekly", "monthly", "one-time"]
  end

  def size_options
    ["1 gallon", "1/2 gallon","1 Pint"]
  end

  def self.getmilk(order_id)
    @order = Order.find(order_id)
    @order.milktype
  end
end
