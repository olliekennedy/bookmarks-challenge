# frozen_string_literal: true

feature 'show index page' do
  scenario 'show the title' do
    visit '/'
    expect(page).to have_content('Bookmark Manager')
  end
end
