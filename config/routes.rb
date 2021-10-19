Rails.application.routes.draw do
  root 'application#hello'
  
  devise_for :users, controllers: { confirmations: 'users/confirmations' }
  
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
