Rails.application.routes.draw do
  namespace :admin do
    resources :facts
    post '/foods/upload_image', to: 'foods#upload_image'
    resources :foods
    resources :tags
    resources :books
  end

  get '/', to: 'home#index'
  get '/nutrient/:slug', to: 'home#nutrient'
  get '/tags/:name', to: 'home#tags'

  get "/search/:term", to: 'search#term'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
