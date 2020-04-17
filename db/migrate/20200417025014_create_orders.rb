class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :milk_id
      t.string :name
      t.string :frequency
      t.string :size
    end
  end
end
