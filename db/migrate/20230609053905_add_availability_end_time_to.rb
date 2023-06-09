class AddAvailabilityEndTimeTo < ActiveRecord::Migration[7.0]
  def change
    add_column :slots, :availability_end_time, :time
  end
end
