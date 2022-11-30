class Course < ApplicationRecord
  validates :course_name, :course_type, presence: true
  has_many :user_courses 
  has_many :users, through: :user_courses, dependent: :destroy
  has_many :comments, as: :commentable
end
