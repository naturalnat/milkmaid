class CreateMilk < ActiveRecord::Migration[6.0]
  def change
    create_table :milks do |t|
      t.string :milktype
    end
  end
end
