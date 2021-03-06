# frozen_string_literal: true
require 'bookmark'
require '/Users/ok/Projects/pairing-challenges/bookmark-manager/02112020/bookmarks-challenge/spec/helpers/db_helpers.rb'

RSpec.describe Bookmark do
  describe '#all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end
  describe '#create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end
  describe '#delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      Bookmark.delete(id: bookmark.id)
      persisted_data = persisted_data(id: bookmark.id)
      expect(persisted_data).to be_nil
    end
  end
  describe '#update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      bookmark = Bookmark.update(id: bookmark.id, title: 'Test URL', url: 'http://www.testurl.com')
      expect(bookmark.title).to eq 'Test URL'
      expect(bookmark.url).to eq 'http://www.testurl.com'
      persisted_data = persisted_data(id: bookmark.id)
      expect(persisted_data['title']).to eq 'Test URL'
      expect(persisted_data['url']).to eq 'http://www.testurl.com'
    end
  end
  describe '#find' do
    it 'finds the correct bookmark and returns the object' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      expect(Bookmark.find(id: bookmark.id).url).to eq 'http://www.testbookmark.com'
    end
  end
end
