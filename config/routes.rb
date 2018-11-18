Rails.application.routes.draw do
  # namespace :nasas do
  #   get 'apod/display'
  # end
  # namespace :nasa do
  #   get 'apod/display'
  # end
  resources :nasas

  resources :users
  resources :searches do
    end
  

get '/apod', to: "nasas#apod"

  match ':controller(/:action(/:id))', :via => :get
  #match 'welcome/index', to: 'welcome:show', via: :all
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
