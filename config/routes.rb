Rails.application.routes.draw do
  
  root to:"main#index"

  get "about" ,to:"about#index"

  get "users" ,to:"users#index"

  get "signup" ,to:"signup#new" 
  post "signup",to:"signup#create"   

  get "login" ,to:"sessions#new"
  post "login" ,to:"sessions#create"

  get "search" ,to:"search#search"
  post "search" ,to:"search#retrieve"


  #delete "logout",to:"sessions#destroy"
  #or
  get "logout",to:"sessions#destroy"




end
