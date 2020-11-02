# frozen_string_literal: true

feature 'test' do
  scenario 'show hello world' do
    visit '/test'
    expect(page).to have_content('Hello world!')
  end
end
