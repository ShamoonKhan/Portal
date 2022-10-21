class Course < ApplicationRecord
    belongs_to :user
    validates :course_name, :course_type, presence: true
end
