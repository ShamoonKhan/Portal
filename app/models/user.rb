class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :trackable

  

        
  enum role: %i[student teacher admin]
  after_initialize :set_default_role, if: :new_record?
  has_many :user_courses
  has_many :courses, through: :user_courses, dependent: :destroy
  has_one_attached :avatar
  has_many :attendances , dependent: :destroy
  has_one :account, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :comments, as: :commentable
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
