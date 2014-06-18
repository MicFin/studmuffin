Studmuffin::Application.routes.draw do

  ### routes for admin on admin back end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  ### vLINE routes
  
  match '_vline/api/v1/oauth/authorize' => 'vline#authorize', :via => :get
  match '_vline/launch' => 'vline#launch', :via => :get
  mount Vline::API => '_vline/api'


  ### routes for users

  devise_for :users, :controllers => { :confirmations => "confirmations", registrations: "devise/registrations", sessions: "sessions", passwords: "passwords" } 

  devise_scope :user do
    authenticated :user do
      root :to => 'appointments#index', as: :user_authenticated_root
      resources :families
      resources :user_dietary_restrictions
      resources :appointments
      get "/appointments", to: "appointments#index", as: :appointments
      resources :user_surveys
      resources :rooms
      match '/party/:id', :to => "rooms#party", :as => :party, :via => :get
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
    match '/sign_in' => 'sessions#new' 
    match '/forgot_password' => 'passwords#new' 
  end

  ### routes for dietitians

  devise_for :dietitians, :controllers => { :confirmations => "confirmations", session: "sessions", passwords: "passwords", registrations: "registrations" } 

  devise_scope :dietitian do
    authenticated :dietitian do
      root :to => 'appointments#index', as: :dietitian_authenticated_root
      resources :families
      resources :user_dietary_restrictions
      resources :appointments
      get "/appointments", to: "appointments#index", as: :appointments
      resources :user_surveys
      resources :rooms
      match '/party/:id', :to => "rooms#party", :as => :party, :via => :get
    end
    unauthenticated :dietitian do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end   
    match '/join' => 'registrations#new'
  end

  ### routes for admin on main site pages

  devise_scope :admin_user do
    ## allow authenticated admin to access the web routes
    authenticated :admin_user do
      resources :families
      resources :user_dietary_restrictions
      resources :appointments
      resources :user_surveys
      resources :rooms
      match '/party/:id', :to => "rooms#party", :as => :party, :via => :get
    end
    unauthenticated :admin_user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end   
    match '/join' => 'registrations#new'
  end

  # get "/dietitians", to: "home#show", as: :dietitian_sign_up
  # if Rails.env.production?
  #    get '404', :to => 'application#page_not_found'
  #    get '500', :to => 'application#server_error'
  #    get '422', :to => 'application#server_error'
  # end


end
