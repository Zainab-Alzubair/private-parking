class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :slot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :checked_in
      t.boolean :checked_out
      t.boolean :is_cancelled

      t.timestamps
    end
  end
end
