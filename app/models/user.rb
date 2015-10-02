class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save :default_values


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:linkedin]


  validates :name, presence: true
  validates :entrance_year, presence: true
  validates :graduation_year, presence: true
  validates :email, presence: true
  validate :entrance_year_should_be_earilier_than_graduation_year

  has_many :interests, dependent: :destroy
  has_many :declarations, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :invitations, dependent: :destroy

  has_many :interested_industries, through: :interests,
           class_name: "Industry",
           source: :industry
  has_many :experienced_industries, through: :experiences,
           class_name: "Industry",
           source: :industry
  has_many :majors, through: :declarations

  has_many :likes, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :job_post
  has_many :attending_events, through: :attendances, source: :job_post

  has_many :job_posts, source: :job_post, foreign_key: 'admin_user_id'
  validate :only_admin_user_has_job_posts?, on: :update

  def entrance_year_should_be_earilier_than_graduation_year
    if entrance_year > graduation_year
      errors[:graduation_year] << "should be after entrance year"
      return false
    end
    return true
  end

  def only_admin_user_has_job_posts?
    unless admin?
      if !job_posts.nil? || !job_posts.empty?
        errors.add(:job_posts, "Only Admin User can have job posts")
        return false
      end
    end
    return true
  end

  def majors_text
    text_format(majors)
  end

  def experienced_industries_text
    text_format(experienced_industries)
  end

  def interested_industries_text
    text_format(interested_industries)
  end

  private

  def text_format(array)
    if array.nil?
      return ""
    end
    if array.first.nil?
      s = ""
    else
      s = array.first.name
    end
    if array.count == 1
      return s
    end
    for i in 1..array.count-1
      unless array[i].name.nil?
        s += (" / " + array[i].name)
      end
    end
    return s
  end

  def default_values
    self.location ||= ""
  end
end
