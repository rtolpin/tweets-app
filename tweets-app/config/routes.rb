Rails.application.routes.draw do
  resources :tweets
  resources :usernames

  root "tweets#index"
  #root to: redirect('/tweets')
end
