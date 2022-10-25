require 'rails_helper'

RSpec.describe 'Authors', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/authors/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/authors/index'
      expect(response).to have_http_status(:success)
    end
  end
end
