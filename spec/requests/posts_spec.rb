require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:all) do
      @author1 = Author.create!(name: 'Vitor',
                                photo: 'https://i.picsum.photos/id/908/200/200.jpg?hmac=CovMVsq4EkU03tnOxNLyxYsLlemPPHBizxcnmaHaRcU',
                                bio: 'Teacher from Brazil.')
      post1 = Post.create!(author: @author1, title: 'Post 1', text: 'text Post 1')                         
    end
    before(:each) do
      get author_posts_path(@author1)
    end
   
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'renders correct template text' do
      expect(response.body).to include('Post Counter: 1')
    end
  end

  describe 'GET /show' do
    before(:each) do
      author_post_path(@author1, @post1)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end
    it 'renders correct template text' do
      expect(response.body).to include('Post 1 by: Vitor')
    end
  end
end
