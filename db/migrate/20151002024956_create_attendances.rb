class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.belongs_to :job_post, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
