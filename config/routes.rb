Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get '/top' => 'home#top'
  root 'home#top'
  #get '/articles/index' => 'articles#index'
  #get 'articles/new' => 'articles#new'
  resources :articles
  post '/articles' => 'articles#create'
end
