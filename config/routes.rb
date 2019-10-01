Rails.application.routes.draw do
  get 'videos/show'

  get 'videos/index'

  get 'videos/create'

  get 'videos/update'

  get 'videos/destroy'

  root to: 'home#index'

  get 'home/index'
  
  resources :videos, except: [:new]

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
