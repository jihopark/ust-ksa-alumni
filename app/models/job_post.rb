class JobPost < ActiveRecord::Base
  has_many :liked_users, through: :likes, source: :user
  has_many :likes, dependent: :destroy

  has_many :attending_users, through: :attendances, source: :user
  has_many :attendances, dependent: :destroy

  has_many :preferences, dependent: :destroy
  has_many :major_preferences, through: :preferences, source: :major, foreign_key: 'major_id'
  has_many :industry_preferences, through: :preferences, source: :industry, foreign_key: 'industry_id'

end
