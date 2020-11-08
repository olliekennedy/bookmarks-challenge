# frozen_string_literal: true
require 'bookmark'

feature 'bookmarks-page' do
  before(:each) do
    populate_test_bookmarks_table
  end
  scenario 'show title' do
    visit '/bookmarks'
    expect(page).to have_content('Bookmarks')
  end
  scenario 'show list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('Google')
  end
  scenario 'add bookmark' do
    visit '/bookmarks'
    fill_in 'title', :with => 'PIZZA'
    fill_in 'url', :with => 'http://www.pizza.org'
    click_on('Add bookmark')
    expect(page).to have_link('PIZZA', href: 'http://www.pizza.org')
  end
  scenario 'delete bookmark' do
    truncate_test_bookmarks_table
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
    visit '/bookmarks'
    first('.bookmark').click_button('Delete')
    expect(page).not_to have_link(bookmark.title)
  end
  # scenario 'update bookmark' do
  #   truncate_test_bookmarks_table
  #   bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
  #   visit '/bookmarks'
  #   first('.bookmark').fill_in 'updated_title', :with => 'Test URL'
  #   first('.bookmark').fill_in 'updated_url', :with => 'http://www.testurl.com'
  #   first('.bookmark').click_button('Update')
  #   expect(page).not_to have_link(bookmark.title)
  #   expect(page).to have_link('Test URL')
  # end
end
