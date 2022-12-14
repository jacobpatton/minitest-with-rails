class User < ApplicationRecord
  scope :recent, -> { where('created_at > ?', 1.week.ago) }

  PROFILE_PHOTO_ROOT_URL = URI 'https://s.gravatar.com/avatar/'

  has_many :posts

  validates :name, :email, presence: true

  def profile_photo_url
    url = PROFILE_PHOTO_ROOT_URL.clone
    url.path << email_md5
    url.to_s
  end

  private

  def email_md5
    Digest::MD5.hexdigest email
  end
end
