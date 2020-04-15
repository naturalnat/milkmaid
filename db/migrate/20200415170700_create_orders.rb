class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :frequency
      t.belongs_to :user, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
