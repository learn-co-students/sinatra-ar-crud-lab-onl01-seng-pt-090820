
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #create
  get "/articles/new" do
    @article = Article.new(params)
    erb :new
  end

  #INDEX
  get "/articles" do
    @articles = Article.all
    erb :index
  end

  #SHOW
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  #POST
  post "/articles" do 
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  #UPDATE
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  #PATCH
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params)
    redirect to "/articles/#{@article.id}"
  end

  #DELETE
  delete "/articles/:id" do
    @article = Article.find(params[:id])
    @article.destroy
    redirect to "/articles"
  end

end
