require 'rails_helper'

RSpec.describe 'Authors', type: :request do
  describe 'GET /show' do
    before(:each) do
      get '/authors/show'
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
      get '/authors/index'
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
