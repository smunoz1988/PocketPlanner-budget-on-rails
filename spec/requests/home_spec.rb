require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'displays the correct title' do
      get '/'
      expect(response.body).to include('PocketPlanner')
    end
  end
end
