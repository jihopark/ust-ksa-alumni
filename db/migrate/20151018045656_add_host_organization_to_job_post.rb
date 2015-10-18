class AddHostOrganizationToJobPost < ActiveRecord::Migration
  def change
    add_column :job_posts, :host_organization, :string
  end
end
