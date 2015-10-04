class AddHasEventToJobPost < ActiveRecord::Migration
  def change
    add_column :job_posts, :has_event, :boolean, default: false
  end
end
