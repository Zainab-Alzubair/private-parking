class AddAvailabilityStartTimeTo < ActiveRecord::Migration[7.0]
  def change
    add_column :slots, :availability_start_time, :time
  end
end
