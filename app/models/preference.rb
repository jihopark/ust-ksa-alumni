class Preference < ActiveRecord::Base
  belongs_to :major
  belongs_to :industry
  belongs_to :job_post
end
