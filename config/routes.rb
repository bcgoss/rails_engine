Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :invoices do
        get '/find', to: 'search#find'
        get '/find_all', to: 'search#find_all'
        get '/random', to: 'search#random'
        get '/:id/transactions', to: 'relations#transactions'
        get '/:id/invoice_items', to: 'relations#invoice_items'
        get '/:id/items', to: 'relations#items'
        get '/:id/customer', to: 'relations#customer'
        get '/:id/merchant', to: 'relations#merchant'
      end
      resources :invoices, only: [:index, :show]

      namespace :transactions do
        get '/find', to: 'search#find'
        get '/find_all', to: 'search#find_all'
        get '/random', to: 'search#random'
        get '/:id/invoice', to: 'relations#invoice'
      end
      resources :transactions, only: [:index, :show]

      namespace :merchants do
        get '/revenue', to: 'revenue#all'
        get '/most_revenue', to: 'revenue#most'
        get '/most_items', to: 'items#most'
        get '/find', to: 'search#find'
        get '/find_all', to: 'search#find_all'
        get '/random', to: 'search#random'
        get '/:id/revenue', to: 'revenue#single'
        get '/:id/customers_with_pending_invoices', to: 'customers_with_pending_invoices#list'
        get '/:id/favorite_customer', to: 'favorite#customer'
        get '/:id/items', to: 'relations#items'
        get '/:id/invoices', to: 'relations#invoices'
      end
      resources :merchants, only: [:index, :show]

      namespace :items do
        get '/find', to: 'search#find'
        get '/find_all', to: 'search#find_all'
        get '/random', to: 'search#random'
        get '/most_revenue', to: 'revenue#most'
        get '/:id/invoice_items', to: 'relations#invoice_items'
        get '/:id/merchant', to: 'relations#merchant'
      end
      resources :items, only: [:index, :show]

      namespace :invoice_items do
        get '/find', to: 'search#find'
        get '/find_all', to: 'search#find_all'
        get '/random', to: 'search#random'
        get '/:id/invoice', to: 'relations#invoice'
        get '/:id/item', to: 'relations#item'
      end
      resources :invoice_items, only: [:index, :show]

      namespace :customers do
        get '/find', to: 'search#find'
        get '/find_all', to: 'search#find_all'
        get '/random', to: 'search#random'
        get '/:id/favorite_merchant', to: 'favorite#merchant'
        get '/:id/invoices', to: 'relations#invoices'
        get '/:id/transactions', to: 'relations#transactions'
      end
      resources :customers, only: [:index, :show]

    end
  end
end
