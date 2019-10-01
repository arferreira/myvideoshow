Rails.application.routes.draw do
  get 'videos/index'
  get 'videos/show'
  get 'videos/new'
  get 'videos/edit'
  get 'videos/create'
  get 'videos/update'
  get 'videos/destroy'
  root to: 'home#index'
  get 'home/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
