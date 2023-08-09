require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers
  
  before(:each) do
    @user = User.create(name: 'mike', email: 'mihael@gmail.com', password: '123456', password_confirmation: '123456')

    login_as(@user, scope: :user)
  end

  describe 'user_groups_path' do
    it 'returns http success' do
      get user_groups_path(@user)
      expect(response).to have_http_status(:success)
    end

    it 'returns http success for new' do
      get new_user_group_path(@user)
      expect(response).to have_http_status(:success)
    end
  end
end