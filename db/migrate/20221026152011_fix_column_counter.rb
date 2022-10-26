class FixColumnCounter < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:posts, :comments_counter, from: nil, to: 0)
    change_column_default(:posts, :likes_counter, from: nil, to: 0) 
    change_column_default(:authors, :posts_counter, from: nil, to: 0)
  end
end
