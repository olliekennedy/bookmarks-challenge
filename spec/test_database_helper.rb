def truncate_test_bookmarks_table
  begin
      con = PG.connect(dbname: 'bookmark_manager_test')#, :user => 'kalindifonda' (implicit user name I think)
      con.exec "TRUNCATE TABLE bookmarks"

  rescue PG::Error => e
    # We want R rated errors!
      puts e.message
  ensure
      con.close if con
  end
end

def populate_test_bookmarks_table
  bookmarks_list = ['http://www.makersacademy.com', 'http://askjeeves.com',
    'http://twitter.com', 'http://www.google.com']
  bookmarks_list.each do |bm|
    Bookmarks.new(bm)
  end
end
