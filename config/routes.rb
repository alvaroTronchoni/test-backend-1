Rails.application.routes.draw do
  resources :task_lists

  root 'task_lists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
