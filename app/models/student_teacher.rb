class StudentTeacher < ApplicationRecord
  belongs_to :students
  belongs_to :teachers
end
