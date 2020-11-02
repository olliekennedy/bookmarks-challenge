# frozen_string_literal: true

feature 'bookmarks-page' do
  scenario 'show title' do
    visit '/bookmarks'
    expect(page).to have_content('Bookmarks')
  end
  scenario 'show list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('https://www.google.com')
    expect(page).to have_content('https://www.amazon.com')
    expect(page).to have_content('https://www.youtube.com')
  end
end
