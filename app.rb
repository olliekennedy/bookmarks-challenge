# frozen_string_literal: true

require 'sinatra/base'
require 'bookmarks'
# This is my new class
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/test' do
    'Hello world!'
  end

  get '/bookmarks' do
    erb :bookmarks
  end

  run! if app_file == $PROGRAM_NAME
end
