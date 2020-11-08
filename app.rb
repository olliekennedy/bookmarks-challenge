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

  post '/bookmarks/create' do
    Bookmark.create(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  post '/bookmarks/delete/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/update/:id' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'/bookmarks/update/index'
  end

  post '/bookmarks/update/:id' do
    Bookmark.update(id: params[:id], title: params[:updated_title], url: params[:updated_url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
