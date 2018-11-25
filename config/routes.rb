Rails.application.routes.draw do
  root 'tops#top'
  devise_for :users
  resources :books
  resources :users
  get "tops/about"
  #get "about" =>
  # get '/' => 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
