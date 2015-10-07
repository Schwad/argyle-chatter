class Post < ActiveRecord::Base
  has_one :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
end
