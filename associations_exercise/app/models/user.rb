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
end
