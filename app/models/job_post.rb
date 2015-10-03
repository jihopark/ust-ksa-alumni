class JobPost < ActiveRecord::Base
  has_one :admin_user, class_name: :'User', foreign_key: 'admin_user_id'
  has_many :liked_users, through: :likes, source: :user
  has_many :likes, dependent: :destroy

  has_many :attending_users, through: :attendances, source: :user
  has_many :attendances, dependent: :destroy

  has_many :preferences, dependent: :destroy
  has_many :major_preferences, through: :preferences, source: :major, foreign_key: 'major_id'
  has_many :industry_preferences, through: :preferences, source: :industry, foreign_key: 'industry_id'


  def event
    if event_time.nil? || event_venue.nil?
      "None"
    else
      "#{event_time} @#{event_venue}"
    end 
  end
end
