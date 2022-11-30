class Attendance < ApplicationRecord
  belongs_to :user
  validates :date, :present, presence: true
end
