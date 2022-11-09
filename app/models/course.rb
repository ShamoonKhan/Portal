class Course < ApplicationRecord
  validates :course_name, :course_type, presence: true
  has_many :table_user_courses
  has_many :users, through: :table_user_courses, dependent: :destroy
end
