require 'rails_helper'

RSpec.describe 'Home Index', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'displays the app title for each user' do
    visit root_path
    expect(page).to have_content("PocketPlanner")
  end

  it 'redirects to login page if not logged in' do
    visit root_path
    expect(page).to have_content("LOG IN")
  end

  it 'redirects to login if click on log in' do
    visit root_path
    click_link "LOG IN"
    expect(page).to have_content("LOGIN")
  end
end