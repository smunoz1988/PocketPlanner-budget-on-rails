require 'rails_helper'

RSpec.describe 'Movements', type: :request do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'mike', email: 'mihael@gmail.com', password: '123456', password_confirmation: '123456')

    login_as(@user, scope: :user)
    @group = Group.create(name: 'Group 1', icon: 'icon.png', author_id: @user.id)  # Use author_id instead of author
    puts "Group ID: #{@group.id}"
  end

  describe 'user_groups_path' do
    it 'returns http success' do
      get user_group_movements_path(user_id: @user.id, group_id: @group.id)
      expect(response).to have_http_status(:success)
    end

    it 'returns http success for new' do
      get new_user_group_movement_path(user_id: @user.id, group_id: @group.id)
      expect(response).to have_http_status(:success)
    end
  end
end
