Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :invoices do
        get '/find', to: 'search#find'
        get '/find_all', to: 'search#find_all'
        get '/random', to: 'search#random'
      end
      resources :invoices, only: [:index, :show]

      namespace :transactions do
        get '/find', to: 'search#find'
        get '/find_all', to: 'search#find_all'
        get '/random', to: 'search#random'
      end
      resources :transactions, only: [:index, :show]

      resources :merchants, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]

      namespace :customers do
        get '/find', to: 'search#find'
        get '/find_all', to: 'search#find_all'
        get '/random', to: 'search#random'
      end
      resources :customers, only: [:index, :show]
    end
  end
end
