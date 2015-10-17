class ChangeEventTimeinJobPost < ActiveRecord::Migration
  def change
    change_column :job_posts, :event_time, :datetime
  end
end
