Rails.application.routes.draw do
  resources :facts
  resources :foods
  resources :tags
  resources :books

  get "/search/:term", to: 'search#term'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
