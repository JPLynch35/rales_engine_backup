Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :invoices do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#show'
      end
      resources :invoices, only: [:index, :show] do
        get 'invoice_items', to: 'invoices/invoice_items#index'
        get 'items', to: 'invoices/items#index'
        get 'transactions', to: 'invoices/transactions#index'
        get 'merchant', to: 'invoices/merchant#index'
        get 'customer', to: 'invoices/customer#index'
      end

      namespace :merchants do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#show'
      end
      resources :merchants, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :items, only: [:index]
      end

    end
  end
end
