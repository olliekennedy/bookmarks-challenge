# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmarks.rb'
# This is my new class
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/test' do
    'Hello world!'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.new.all
    erb :'bookmarks/index'
  end

  run! if app_file == $PROGRAM_NAME
end
