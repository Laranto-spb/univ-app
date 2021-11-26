Rails.application.routes.draw do
  
  root "courses#index"

  resources :courses


  resources :students, except: [:new]
  get 'signup', to: "students#new"
  

end
