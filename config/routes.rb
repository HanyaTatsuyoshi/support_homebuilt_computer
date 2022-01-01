Rails.application.routes.draw do
  
  devise_for :users, controllers: { confirmations: 'users/confirmations',
                                    registrations: 'users/registrations' }
  
  root 'toppages#index'
  resources :users, only: [:show]
  resources :customs, only: [:new, :create, :show, :edit, :update, :destroy]
  get 'after_login_to_custom', to: 'home#after_login_to_custom'
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
