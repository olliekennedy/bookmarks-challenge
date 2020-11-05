def truncate_test_bookmarks_table
  begin
      con = PG.connect(dbname: 'bookmark_manager_test')
      con.exec "TRUNCATE TABLE bookmarks"
  rescue PG::Error => e
      puts e.message
  ensure
      con.close if con
  end
end

def populate_test_bookmarks_table
  bookmarks_list = [ { title: 'Makers', url: 'http://www.makersacademy.com' },
                     { title: 'Ask Jeeves', url: 'http://askjeeves.com' },
                     { title: 'Google', url: 'http://www.google.com' } ]
  bookmarks_list.each do |bm|
    Bookmark.create(title: bm[:title], url: bm[:url])
  end
end
