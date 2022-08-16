Rails.application.routes.draw do
  # get 'welcome_pages/index'

  get 'customers/index', as: '/customers'

  devise_for :users

  scope '/admin' do
    resources :users
  end

  # root 'welcome_pages#index'
  root 'customers#index'

  resources :customers do
    collection do
      get 'check_all'
      post 'generate_pdf'
    end
  end
end
