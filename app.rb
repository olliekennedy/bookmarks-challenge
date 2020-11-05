# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark.rb'
# This is my new class
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/test' do
    'Hello world!'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks' do
    Bookmark.create(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end
  run! if app_file == $PROGRAM_NAME
end
