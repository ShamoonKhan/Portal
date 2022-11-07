class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: [:student, :teacher, :admin] 
  after_initialize :set_default_role, if: :new_record?
  has_many :table_user_courses
  has_many :courses, through: :table_user_courses
  has_one_attached :avatar
  has_many :attendances
  # user.avatar.attach io: File.open("~/face.jpg"), filename: "avatar.jpg", content_type: "image/jpg"
  # user.avatar.exist? # => true
  # user.avatar.purge
  # user.avatar.exist? # => false
  validates_presence_of :avatar
  private
  def set_default_role
    self.role ||= :admin
  end
end
