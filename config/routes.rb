Rails.application.routes.draw do
    root 'home#index', as: 'home'

    resources :companies
    resources :employees

    
end