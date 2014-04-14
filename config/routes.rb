Studmuffin::Application.routes.draw do
  match '_vline/api/v1/oauth/authorize' => 'vline#authorize', :via => :get
  match '_vline/launch' => 'vline#launch', :via => :get
  mount Vline::API => '_vline/api'

  devise_for :users
  resources :users do
    resources :notes
  end
devise_scope :user do
  authenticated :user do
    root :to => 'home#show', as: :authenticated_root
  end
  unauthenticated :user do
    root :to => 'devise/registrations#new', as: :unauthenticated_root
  end
end
end
