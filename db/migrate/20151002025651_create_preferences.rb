class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.belongs_to :job_post, index: true
      t.belongs_to :major, index: true
      t.belongs_to :industry, index: true

      t.timestamps null: false
    end
  end
end
