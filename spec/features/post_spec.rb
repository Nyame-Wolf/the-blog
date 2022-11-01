require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before(:each) do
    @author1 = Author.create!(name: 'Mumenya',
                              photo: 'https://picsum.photos/200',
                              bio: 'Pilot from Venus')
    @author2 = Author.create!(name: 'Diego',
                              photo: 'https://picsum.photos/200',
                              bio: 'Engineer from Guatemala')
    @post1 = Post.create!(author: @author2, title: 'Post1', text: 'text Post 1')
    @post2 = Post.create!(author: @author2, title: 'Post2', text: 'text Post 2')
    @post3 = Post.create!(author: @author2, title: 'Post3', text: 'text Post 3')
    @post4 = Post.create!(author: @author2, title: 'Post4', text: 'text Post 4')

    @comment1 = Comment.create!(text: 'comment1', author: @author2, post: @post2)
    @comment1 = Comment.create!(text: 'comment2', author: @author1, post: @post2)
    @comment1 = Comment.create!(text: 'comment3', author: @author2, post: @post2)
    @comment1 = Comment.create!(text: 'comment4', author: @author1, post: @post2)
    @comment1 = Comment.create!(text: 'comment5', author: @author2, post: @post2)
    @comment1 = Comment.create!(text: 'comment6', author: @author1, post: @post2)

    visit author_posts_path(@author2)
  end

  describe 'post index page' do
    it 'see the user\'s profile picture.' do
      expect(page.body).to include('https://picsum.photos/200')
    end
    it 'see the user\'s username' do
      expect(page.find('h2', text: 'Diego')).to be_truthy
      expect(page).to have_content('Diego')
    end
    it 'see the number of posts the user has written.' do
      expect(page.body).to include('Posts: 4')
      expect(page).to have_content("Posts: #{@author2.posts.count}")
    end
    it 'I can see a post\'s title.' do
      expect(page).to have_content(@post2.title)
    end
    it 'I can see a post\'s body.' do
      expect(page).to have_content(@post2.text)
    end
    it 'I can see the first comments on a post.' do
      expect(page).not_to have_content('comment1')
      expect(page).to have_content('comment2')
      expect(page).to have_content('comment3')
      expect(page).to have_content('comment4')
      expect(page).to have_content('comment5')
      expect(page).to have_content('comment6')
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content("Comments:#{@post2.comments.count}")
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content("Likes: #{@post2.likes.count}")
    end

    it 'I can see a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('Pagination')
    end

    it 'When I click on a post, it redirects me to that post\'s show page.' do
      click_link('Post2')
      expect(current_path).to eql(author_post_path(@author2, @post2))
    end
  end
end
