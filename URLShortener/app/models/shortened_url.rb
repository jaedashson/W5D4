# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :user_id, presence: true
  validates :short_url, presence: true
  validates :short_url, uniqueness: true
  
  def self.random_code
    random_str = SecureRandom.urlsafe_base64

    unless ShortenedUrl.exists?(short_url: random_str)
      random_str
    else
      self.random_code
    end
  end
  
  def self.create_short_url(user, long_url)
    short_url = ShortenedUrl.random_code
    ShortenedUrl.new(user_id: user.id,
    long_url: long_url,
    short_url: short_url
    )
  end

  belongs_to :submitter,
    primary_key: :id, # User's id
    foreign_key: :user_id, # this ShortenedUrl's user_id
    class_name: :User
end
