class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :title, :length => { :in => 8..200 }
  validates :body, presence: true

end
