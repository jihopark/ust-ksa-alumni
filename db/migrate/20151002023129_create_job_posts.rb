class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.string :description
      t.string :title
      t.date :event_time
      t.string :event_venue
      t.date :expire_date
      t.boolean :published
      t.string :code

      t.timestamps null: false
    end
  end
end
