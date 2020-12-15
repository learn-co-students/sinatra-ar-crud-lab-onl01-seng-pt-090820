
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/articles/new' do
    erb :new
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles' do
    article = Article.create(params)
    redirect :"/articles/#{article.id}"
    # * tells your controller what to do when your form sends that POST request, 
    # * so create a route on your controller post '/articles' that creates a new
    # * article from the params from the form, then redirects to that new article's show page
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  # * patch to update 
  patch '/articles/:id' do 
    v = Article.find(params[:id])
    v.update(title: params[:title], content: params[:content])
    redirect :"/articles/#{v.id}"
  end
  # * delete to remove
  # * under show.erb
  delete '/articles/:id' do
    v = Article.find(params[:id])
    v.destroy
    redirect :'/articles'
  end

end
