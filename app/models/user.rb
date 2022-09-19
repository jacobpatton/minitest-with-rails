class User < ApplicationRecord

  scope :recent, -> { where('created_at > ?', 1.week.ago)}

  has_many :posts

  validates :name, :email, presence: true

end
