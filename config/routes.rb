Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get 'welcome/index'
  resources :courses do
    collection do
      get :reg_students
    end
  end  
  resources :accounts
  resources :users
  resources :welcome
  resources :table_user_courses
  resources :attendances
end
