# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord 
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :submitted_urls,
    primary_key: :id, # this User's id
    foreign_key: :user_id, # ShortenedUrl's user_id
    class_name: :ShortenedUrl
end
