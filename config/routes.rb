Rails.application.routes.draw do
  get 'comments/index'
  get 'assignments/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index' do
    post 'do_reset_password'
  end
  get 'welcome/index'
  resources :courses do
    collection do
      get :reg_students
    end
  end
  resources :accounts
  resources :users
  resources :welcome
  resources :attendances
  resources :assignments
  resources :submits
  resources :comments
end
