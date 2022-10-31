class Post < ApplicationRecord
  belongs_to :author
  has_many :comments
  has_many :likes
  after_save :update_posts_counter_per_user
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def five_most_recent_comments_per_post
    comments.last(5)
  end

  private

  def update_posts_counter_per_user
    author.update(posts_counter: author.posts.count)
  end
end
