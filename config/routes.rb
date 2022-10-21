Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#homepage"
  get "dash" , to: "welcome#dash"
  resources :courses
  resources :students
  resources :teachers
  resources :accounts
end
