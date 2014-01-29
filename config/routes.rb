Studmuffin::Application.routes.draw do
  devise_for :users
  resources :users

  root to: 'home#show'
end
