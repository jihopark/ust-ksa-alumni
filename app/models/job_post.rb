class JobPost < ActiveRecord::Base
  has_many :liked_users, through: :likes, source: :user
  has_many :likes, dependent: :destroy

  has_many :attending_users, through: :attendances, source: :user
  has_many :attendances, dependent: :destroy
end
