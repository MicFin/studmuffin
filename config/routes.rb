Studmuffin::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  match '_vline/api/v1/oauth/authorize' => 'vline#authorize', :via => :get
  match '_vline/launch' => 'vline#launch', :via => :get
  mount Vline::API => '_vline/api'

  devise_for :users, :controllers => { :confirmations => "confirmations", registrations: "devise/registrations", sessions: "sessions" } 

  devise_scope :user do
    authenticated :user do
      root :to => 'home#show', as: :authenticated_root
      resources :families
      resources :user_dietary_restrictions
      resources :appointments
      resources :user_surveys
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
    match '/sign_in' => 'sessions#new' 
  end

  devise_for :dietitians, :controllers => { :confirmations => "confirmations", registrations: "devise/registrations", session: "sessions" } 

  devise_scope :dietitian do
    authenticated :dietitian do
      root :to => 'home#show', as: :authenticated_root
      resources :families
      resources :user_dietary_restrictions
      resources :appointments
      resources :user_surveys
    end
    unauthenticated :dietitian do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end   
    match '/dietitians' => 'devise/registrations#new'
  end

  get "/show", to: "home#show", as: :show_page

  # if Rails.env.production?
  #    get '404', :to => 'application#page_not_found'
  #    get '500', :to => 'application#server_error'
  #    get '422', :to => 'application#server_error'
  # end


end
