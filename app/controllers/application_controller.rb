
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
  end

  post '/articles' do
    a = Article.create(params).id

    redirect "/articles/#{a}"
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id/edit' do
    @article = Article.find(params["id"])

    erb :edit
  end

  patch '/articles/:id' do
    a = Article.find(params["id"])
    a.update(params["article"])

    redirect "/articles/#{a.id}"
  end

  delete '/articles/:id' do
    Article.destroy(params["id"])

    redirect "/articles"
  end

  get '/articles/:id' do
    @article = Article.find(params["id"])

    erb :show
  end


  get '/articles' do
    @articles = Article.all
    erb :index
  end





end
