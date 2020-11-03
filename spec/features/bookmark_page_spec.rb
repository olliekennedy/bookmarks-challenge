# frozen_string_literal: true
require 'bookmarks'

feature 'bookmarks-page' do
  scenario 'show title' do
    visit '/bookmarks'
    expect(page).to have_content('Bookmarks')
  end
  scenario 'show list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('http://www.google.com')
  end
end
