Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get '/accept', to: 'home#accept'
  get '/reject', to: 'home#reject'
  get '/restaurant', to: 'home#restaurant'
end
