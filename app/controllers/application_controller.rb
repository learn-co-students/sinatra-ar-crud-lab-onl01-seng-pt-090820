
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #create
  get '/articles/new' do
    article = Article.create(params)
    erb :new
  end

  #INDEX
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #SHOW
  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  #POST
  post '/articles' do 
    @article = Article.new(title: params[:title], content: params[:content])
    redirect to '/articles/:id'
  end

  #UPDATE
  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  #PATCH
  patch '/articles/:id' do
  end

  #DELETE
  delete '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.destroy
    redirect to "/articles"
  end

end
