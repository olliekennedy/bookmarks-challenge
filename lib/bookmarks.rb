# frozen_string_literal: true
require 'pg'

# This is my bookmarks class!!!!!!!!!!!
class Bookmarks
  def self.create(title, url)
    DBConnection.query("bookmark_manager",
                       "INSERT INTO bookmarks(title, url)
                        VALUES('#{title}', '#{httpeed(url)}')")
  end

  def self.all
    result = DBConnection.query("bookmark_manager",
                                "SELECT title, url FROM bookmarks")
    result.map { |bookmark|
      { title: bookmark['title'], url: bookmark['url'] }
    }
  end

  private

  def self.httpeed(url)
    url[0, 4] == 'http' ? url : url.prepend('http://')
  end
end
