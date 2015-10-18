class AddHostContactToJobPost < ActiveRecord::Migration
  def change
    add_column :job_posts, :host_contact, :string
  end
end
