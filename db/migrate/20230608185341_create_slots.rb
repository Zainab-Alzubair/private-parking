class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.string :time
      t.string :car_type
      t.string :price
      t.string :decimal
      t.boolean :is_disabled
      t.boolean :is_available
      t.boolean :is_cancelled
      t.string :cancelation_policy

      t.timestamps
    end
  end
end
