# frozen_string_literal: true
require 'pg'

# This is my bookmarks class!!!!!!!!!!!
class Bookmarks

  def self.all
    begin
      if ENV['RACK_ENV'] == 'test'
        con = PG.connect(dbname: 'bookmark_manager_test')
      else
        con = PG.connect(dbname: 'bookmark_manager')
      end
      result = con.exec "SELECT url FROM bookmarks"
      result.map { |bookmark| bookmark['url'] }

    rescue PG::Error => e
      # We want R rated errors!
        puts e.message
    ensure
        result.clear if result
        con.close if con
    end
  end
end
