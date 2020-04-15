class CreateMilks < ActiveRecord::Migration[6.0]
  def change
    create_table :milks do |t|
      t.string :type
      t.integer :size


      t.timestamps
    end
  end
end
