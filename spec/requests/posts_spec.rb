require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/authors/:author_id/posts/'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'renders correct template text' do
      expect(response.body).to include('User posts')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get '/authors/:author_id/posts/:id'
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end
    it 'renders correct template text' do
      expect(response.body).to include('posts show route')
    end
  end
end
