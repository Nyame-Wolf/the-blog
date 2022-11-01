require 'rails_helper'
RSpec.feature 'Posts', type: :feature do
  before(:each) do
    @author1 = Author.create!(name: 'Mumenya',
                              photo: 'https://picsum.photos/200',
                              bio: 'Pilot from Venus', posts_counter: 0)
    @author2 = Author.create!(name: 'Diego',
                              photo: 'https://picsum.photos/200',
                              bio: 'Engineer from Guatemala', posts_counter: 0)
    @post1 = Post.create!(author: @author2, title: 'Post 1', text: 'text Post 1', comments_counter: 0, likes_counter: 0)
    @post2 = Post.create!(author: @author2, title: 'Post 2', text: 'text Post 2', comments_counter: 0, likes_counter: 0)
    @post3 = Post.create!(author: @author2, title: 'Post 3', text: 'text Post 3', comments_counter: 0, likes_counter: 0)
    @post4 = Post.create!(author: @author2, title: 'Post 4', text: 'text Post 4', comments_counter: 0, likes_counter: 0)

    @comment1 = Comment.create!(text: 'comment1', author: @author2, post: @post2)
    @comment1 = Comment.create!(text: 'comment2', author: @author1, post: @post2)
    @comment1 = Comment.create!(text: 'comment3', author: @author2, post: @post2)
    @comment1 = Comment.create!(text: 'comment4', author: @author1, post: @post2)
    @comment1 = Comment.create!(text: 'comment5', author: @author2, post: @post2)
    @comment1 = Comment.create!(text: 'comment6', author: @author1, post: @post2)

    visit author_post_path(@author2, @post2)
  end

  describe 'post show page' do
    it 'I can see the post\'s title.' do
      expect(page.body).to have_content('Post 2')
    end
    it 'I can see who wrote the post.' do
      expect(page).to have_content('Diego')
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content("Comments: #{@post2.comments.count}")
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content("Likes: #{@post2.likes.count}")
    end

    it 'I can see a post\'s body.' do
      expect(page).to have_content(@post2.text)
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_content('Mumenya')
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content('comment1')
      expect(page).to have_content('comment2')
      expect(page).to have_content('comment3')
      expect(page).to have_content('comment4')
      expect(page).to have_content('comment5')
      expect(page).to have_content('comment6')
    end
  end
end
