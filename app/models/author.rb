class Author < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def three_recent_posts_per_user
    # posts.limit(3).order(created_at: :desc)
    Post.last(3)
  end
end
