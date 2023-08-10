require 'rails_helper'

RSpec.describe 'Groups Index', type: :system do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'mike', email: 'mihael@gmail.com', password: '123456', password_confirmation: '123456')

    login_as(@user, scope: :user)
    driven_by(:rack_test)
  end

  it 'displays the add new category button' do
    visit user_groups_path(@user)
    expect(page).to have_content('ADD A NEW CATEGORY')
  end
end
