Rails.application.routes.draw do
  
  devise_for :admins, controllers: { sessions:      'admins/sessions',
                                     passwords:     'admins/passwords' }
  namespace :admins do
    resources :users, only: [:index, :show, :destroy]
    resources :customs, only: [:index, :show, :destroy]
  end
  
  devise_for :users, controllers:  { sessions:      'users/sessions',
                                     passwords:     'users/passwords',
                                     confirmations: 'users/confirmations',
                                     registrations: 'users/registrations' }
  
  root 'toppages#index'
  resources :users, only: [:show]
  resources :customs, only: [:new, :create, :show, :edit, :update, :destroy]
  get 'after_login_to_custom', to: 'home#after_login_to_custom'
  resources :contacts, only: [:new, :create]
  
  get '/privacy-policy', to: 'static_pages#privacy_policy'
  
  get '/sitemap', to: redirect("https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/sitemaps/sitemap.xml.gz")
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
