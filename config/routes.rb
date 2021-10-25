Rails.application.routes.draw do
  get 'customs/new'
  get 'customs/edit'
  root 'toppages#index'
  
  devise_for :users, controllers: { confirmations: 'users/confirmations',
                                    registrations: 'users/registrations' }
  
  resources :users, only: [:show]
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
