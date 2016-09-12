Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "animals#index"
  resources :users, only: [:new, :create, :show]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :animals
  namespace :admin do
    resources :locations, only: [:index, :new, :create]
  end

  resources :sightings

  resources :kingdoms, only:  [:show, :index]
  resources :phylums, only:  [:show, :index]
  resources :classes, only:  [:show, :index], as: :taxonomical_classes
  resources :orders, only:  [:show, :index]
  resources :families, only:  [:show, :index]
  resources :genus, only:  [:show, :index]
  resources :species, only:  [:show, :index]
  # get '/animals', to: 'animals#index'
  # get '/animals/new', to: 'animals#new', as: "new_animal"
  # post '/animals', to: 'animals#create'
  # get '/animals/:id', to: 'animals#show', as: 'animal'
  # get '/animals/:id/edit', to: 'animals#edit', as: 'edit_animal'
  # patch '/animals/:id', to: 'animals#update'
  # delete '/animals/:id', to: 'animals#destroy'
end
