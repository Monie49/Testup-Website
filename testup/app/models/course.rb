class Course < ApplicationRecord
     has_and_belongs_to_many :users
     has_many :exams
     has_one :user, as: :teacher
end
