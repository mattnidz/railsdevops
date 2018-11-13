Rails.application.routes.draw do
  resources :users
  #get 'welcome/index'
  match ':controller(/:action(/:id))', :via => :get
  #match 'welcome/index', to: 'welcome:show', via: :all
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
