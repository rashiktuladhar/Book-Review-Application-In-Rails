Rails.application.routes.draw do

 #restful routes for books controller 
 resources :books

 # root path
 root 'books#index'


end
