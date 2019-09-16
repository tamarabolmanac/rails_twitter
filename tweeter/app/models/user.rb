class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :username, uniqueness: true
  validates_confirmation_of :password, message: "should match confirmation", if: :password
  validates :first_name, presence: true

  has_many :tweets

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
