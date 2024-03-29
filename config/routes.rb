Rails.application.routes.draw do

  get 'kondatelists/createKondate'
  post 'kondatelists/createKondate'
  get 'kondatelists/updateKondate'
  post 'kondatelists/updateKondate'
  patch 'kondatelists/updateKondate'
  get 'kondatelists/deleteKondate'
  post 'kondatelists/deleteKondate'
  delete 'kondatelists/deleteKondate'
  get 'kondatelists/showKondate'
  post 'kondatelists/showKondate'
  get 'menus/search'
  post 'menus/search'
  get 'users/index'
  get 'menus/edit_menu'
  post 'menus/edit_menu'
  get 'menus/update'
  post 'menus/update'
  patch 'menus/update'
  get 'menus/create_menu'
  post 'menus/create_menu'
  get 'menus/delete'
  post 'menus/delete'
  delete 'menus/delete'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
