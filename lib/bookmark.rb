# frozen_string_literal: true
require 'pg'
require '/Users/ok/Projects/pairing-challenges/bookmark-manager/02112020/bookmarks-challenge/lib/db_connection.rb'

# This is my bookmark class!!!!!!!!!!!
class Bookmark
  attr_reader :id, :title, :url
  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.create(title:, url:)
    result = DBConnection.query("bookmark_manager",
      "INSERT INTO bookmarks(title, url)
       VALUES('#{title}', '#{httpeed(url)}')
       RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.all
    result = DBConnection.query("bookmark_manager",
      "SELECT id, title, url FROM bookmarks")
    result.map { |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    }
  end

  def self.delete(id:)
    DBConnection.query("bookmark_manager",
      "DELETE from bookmarks
       WHERE id='#{id}'")
  end

  def self.update(id:, title:, url:)
    result = DBConnection.query("bookmark_manager",
      "UPDATE bookmarks
       SET title='#{title}', url='#{httpeed(url)}'
       WHERE id='#{id}'
       RETURNING id, title, url")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
    result = DBConnection.query("bookmark_manager",
      "SELECT * FROM bookmarks
       WHERE id=#{id}
    ")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  private

  def self.httpeed(url)
    url[0, 4] == 'http' ? url : url.prepend('http://')
  end
end
