class Post < ApplicationRecord
  belongs_to :author
  has_many :comments
  has_many :likes
  after_save :update_posts_counter_per_user

  def five_most_recent_comments_per_post
    comments.last(5)
  end

  private

  def update_posts_counter_per_user
    author.update(posts_counter: author.posts.length)
  end
end
