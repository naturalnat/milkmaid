# frozen_string_literal: true

class AddMilkIdToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :milktype, :string
  end
end
