Studmuffin::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  match '_vline/api/v1/oauth/authorize' => 'vline#authorize', :via => :get
  match '_vline/launch' => 'vline#launch', :via => :get
  mount Vline::API => '_vline/api'

  devise_for :users, :controllers => { :confirmations => "confirmations", registrations: "devise/registrations" } 

  devise_scope :user do
    authenticated :user do
      root :to => 'home#show', as: :authenticated_root
      resources :families
      resources :user_dietary_restrictions
      resources :meetings
      resources :appointments
      resources :user_surveys
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  get "/survey", to: "home#survey", as: :survey_page
  get "/show", to: "home#show", as: :show_page

end
