require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #READ
  get '/articles' do 
    @articles = Article.all
    erb :index
  end

    #CREATE
    get '/articles/new' do 
      erb :new
    end 

  #READ
  get '/articles/:id' do 
    @article = Article.find_by(id: params[:id])
    erb :show
  end 

  #CREATE
  post '/articles' do 
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end 

  #UPDATE
  get '/articles/:id/edit' do 
    @article = Article.find_by(id: params[:id])
    erb :edit 
  end

  #UPDATE 
  patch '/articles/:id' do 
    @article = Article.find_by(id: params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect to "/articles/#{@article.id}"
  end 

  #DELETE
  delete '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.destroy
    redirect to '/articles'
  end 

end
