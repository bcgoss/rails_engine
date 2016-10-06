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

      namespace :merchants do
        get '/:id/revenue', to: 'revenue#total'
        get '/:id/customers_with_pending_invoices', to: 'customers_with_pending_invoices#list'
        get '/find', to: 'search#find'
        get '/find_all', to: 'search#find_all'
        get '/random', to: 'search#random'
      end
      resources :merchants, only: [:index, :show]

      namespace :items do
        get '/find', to: 'search#find'
        get '/find_all', to: 'search#find_all'
        get '/random', to: 'search#random'
      end
      resources :items, only: [:index, :show]

      namespace :invoice_items do
        get '/find', to: 'search#find'
        get '/find_all', to: 'search#find_all'
        get '/random', to: 'search#random'
      end
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
