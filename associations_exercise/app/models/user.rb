# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :enrollments,
    foreign_key: :student_id, # Enrollment's student_id
    primary_key: :id, # Student's id
    class_name: :Enrollment

  has_many :enrolled_courses,
    through: :enrollments, # method in User
    source: :course  # method in Enrollment

  has_many :courses_taught,
    foreign_key: :instructor_id, # Course's instructor_id
    primary_key: :id, # Instructor's (User) id
    class_name: :Course

  # Untested method
  has_many :instructors,
    through: :enrolled_courses,
    source: :instructor
end
