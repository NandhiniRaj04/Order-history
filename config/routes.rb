Rails.application.routes.draw do
  resources :users, only: [:index] do
    member do
      get 'download_orders_csv'
    end
  end
end
