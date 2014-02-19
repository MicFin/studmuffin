Studmuffin::Application.routes.draw do
  match '_vline/api/v1/oauth/authorize' => 'vline#authorize', :via => :get
  match '_vline/launch' => 'vline#launch', :via => :get
  mount Vline::API => '_vline/api'

  devise_for :users
  resources :users do
    resources :notes
  end

  root to: 'home#show'
end
