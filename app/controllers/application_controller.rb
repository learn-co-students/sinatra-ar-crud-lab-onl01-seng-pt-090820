
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "This should be readable if shotgun worked."
  end

  get '/articles' do
    @articles = Article.all

    erb :"articles/index"
  end

  get '/articles/new' do
    erb :"articles/new"
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    
    erb :"articles/show"
  end
  
  post '/articles' do
    @article = Article.create(params)
    
    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])

    erb :"articles/edit"
  end
end
