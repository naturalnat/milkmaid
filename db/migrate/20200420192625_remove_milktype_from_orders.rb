# frozen_string_literal: true

class RemoveMilktypeFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :milktype
  end
end
