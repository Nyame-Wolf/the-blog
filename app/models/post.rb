class Post < ApplicationRecord
  belongs_to :author
  has_many :comments
  has_many :likes

  def five_most_recent_comments_per_post
    comments.limit(5).order(created_at: :desc)
    Comment.last(5)
  end
end
