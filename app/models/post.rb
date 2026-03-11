class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many_attached :post_images

  validates :content, presence: true

  # Scopes for feed
  scope :feed_for, ->(user) {
    following_ids = user.following.pluck(:id) + [user.id]
    where(user_id: following_ids).order(created_at: :desc)
  }

  scope :recent, -> { order(created_at: :desc) }

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def likes_count
    likes.count
  end

  def comments_count
    comments.count
  end
end
