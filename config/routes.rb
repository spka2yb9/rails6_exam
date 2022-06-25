Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'products#index'
  post '/', to: 'products#index'
  get '/items/:id', to: 'products#detail'
end
