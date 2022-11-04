class Like < ApplicationRecord
  belongs_to :author
  belongs_to :post
  after_save :update_likes_counter

  # validates :author_id, uniqueness: { scope: :post_id }

  private

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
