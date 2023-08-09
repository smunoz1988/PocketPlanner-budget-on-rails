require 'rails_helper'

RSpec.describe 'Movement Index', type: :system do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'mike', email: 'mihael@gmail.com', password: '123456', password_confirmation: '123456')
    login_as(@user, scope: :user)
    @group = Group.create(name: 'Group 1', icon: 'icon.png', author_id: @user.id) 
    driven_by(:rack_test)
  end

  it 'displays the add a new transaction button' do
    visit user_group_movements_path(user_id: @user.id, group_id: @group.id)
    expect(page).to have_content("add a new transaction")
  end
end