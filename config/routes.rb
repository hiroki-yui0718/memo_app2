Rails.application.routes.draw do
  get '/login',to:"sessions#new"
  post '/login',to:"sessions#create"
  get '/logout',to:"sessions#destroy"
  root 'memos#index'
  resources :memos
  get '/auth/:provider/callback' => "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
