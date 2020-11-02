# frozen_string_literal: true

RSpec.describe Bookmarks do
  describe '#all' do
    it 'returns a list of bookmarks' do
      bookmarks = subject.all
      expect(bookmarks).to include('https://www.google.com')
      expect(bookmarks).to include('https://www.amazon.com')
      expect(bookmarks).to include('https://www.youtube.com')
    end
  end
end
