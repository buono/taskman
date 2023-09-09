Rails.application.routes.draw do
#  get 'tasks/index'
#  get 'tasks/show'
#  get 'tasks/new'
#  get 'tasks/edit'
  resources :tasks
  root to: 'tasks#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
