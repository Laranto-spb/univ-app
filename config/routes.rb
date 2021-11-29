Rails.application.routes.draw do
  
  root "courses#index"

  resources :courses


  resources :students, except: [:new]
  get 'signup', to: "students#new"

  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  

end
