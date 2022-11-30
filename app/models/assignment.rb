class Assignment < ApplicationRecord
    belongs_to :user
    validates :name, length: { minimum: 1, maximum:120 }
    validates :description, length: { minimum: 1 }
    mount_uploader :picture
    has_many :submits, dependent: :destroy
end
