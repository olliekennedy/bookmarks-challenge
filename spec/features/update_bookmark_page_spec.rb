require 'bookmark'

feature 'update_bookmarks_page' do
  scenario 'update a bookmark' do
    visit '/bookmarks'
    first('.bookmark').click_button('Update')
    fill_in 'updated_title', :with => 'Test Bookmark'
    fill_in 'updated_url', :with => 'testbookmark.com'
    click_on('Update Bookmark')
    expect(page).to have_current_path('/bookmarks')
    expect(page).to have_link('Test Bookmark', href: 'http://testbookmark.com')
    expect(page).not_to have_link('Makers', href: 'http://www.makersacademy.com')
  end
end
