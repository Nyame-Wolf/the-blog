require 'rails_helper'

RSpec.describe 'Authors', type: :request do
  describe 'GET /show' do
    before(:all) do
      @author1 = Author.create!(name: 'Vitor',
                                photo: 'https://i.picsum.photos/id/908/200/200.jpg?hmac=CovMVsq4EkU03tnOxNLyxYsLlemPPHBizxcnmaHaRcU',
                                bio: 'Teacher from Brazil.')
    end
    before(:each) do
      get author_path(@author1.id)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end
    it 'renders correct template text' do
      expect(response.body).to include('Authors show')
    end
  end

  describe 'GET /index' do
    before(:each) do
      get authors_path
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /' do
    before(:each) do
      get '/'
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'renders correct template text' do
      expect(response.body).to include('Authors')
    end
  end
end
