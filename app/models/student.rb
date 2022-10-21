class Student < ApplicationRecord
    has_many :student_teachers
    has_many :teachers, :through => :student_teachers

    has_many :courses
    accepts_nested_attributes_for :student_teachers
    has_one :account
end
