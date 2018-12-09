Rails.application.routes.draw do
  get 'menus/search'
  post 'menus/search'
  post 'menus', to: 'menus#search'
  get 'menus/edit'
  get 'menus/find'
  post 'menus', to: 'menus#find'
  post 'menus/find'
  get 'users/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
