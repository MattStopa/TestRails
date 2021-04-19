Rails.application.routes.draw do
  namespace :admin do
    resources :facts
    resources :foods
    resources :tags
    resources :books
  end

  get "/search/:term", to: 'search#term'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
