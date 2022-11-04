require 'rails_helper'

RSpec.describe 'Author index page', type: :feature do
  before(:each) do
    @author1 = Author.create!(name: 'Mumenya', photo: 'https://picsum.photos/200', bio: 'Pilot from Venus')
    @author2 = Author.create!(name: 'Diego',
                              photo: 'https://picsum.photos/200',
                              bio: 'Engineer from Guatemala')
    @post1 = Post.create!(author: @author2, title: 'Post 1', text: 'text Post 1')
    visit authors_path
  end
  describe 'index page' do
    it 'I can see the username of all other users.' do
      expect(page).to have_content(@author1.name)
    end
    it 'I can see the username of all other users.' do
      expect(page).to have_content(@author2.name)
    end
    it 'I can see the profile picture for each user.' do
      images = page.all('img')
      expect(images.count).to eq(Author.all.count)
    end
    it 'I can see the number of posts each user has written.' do
      expect(page).to have_content('Number of Posts:')
    end
    it 'When I click on a user, I am redirected to that user\'s show page.' do
      click_on('Mumenya')
      expect(page).to have_content('Pilot from Venus')
      expect(current_path).to eql(author_path(@author1.id))
    end
  end
end
