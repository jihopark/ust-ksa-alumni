class AddAdminUserIdToJobPost < ActiveRecord::Migration
  def change
    add_column :job_posts, :admin_user_id, :integer
  end
end
