# frozen_string_literal: true
require 'pg'

# This is my bookmarks class!!!!!!!!!!!
class Bookmarks

  def self.all
    begin
        con = PG.connect(dbname: 'bookmark_manager')#, :user => 'kalindifonda' (implicit user name I think)
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
