class CreateMilks < ActiveRecord::Migration[6.0]
  def change
    create_table :milks do |t|
      t.string :milktype
      t.boolean :in_order

      t.timestamps
    end
  end
end
