Rails.application.routes.draw do
  get 'welcome_pages/index'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'register'
  }
  root 'welcome_pages#index'

  resources :customers do
    collection do
      get 'check_all'
      post 'generate_pdf'
    end
  end
end
