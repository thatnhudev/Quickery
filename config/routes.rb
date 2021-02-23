Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'foods/index'
      post 'foods/create'
      get '/show/:id', to: 'foods#show'
      delete '/destroy/:id', to: 'foods#destroy'
    end
  end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepage#index'
  get '/*path' => 'homepage#index'
end
