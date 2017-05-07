Rails.application.routes.draw do
  get 'welcome_pages/index'

  devise_for :users
  root 'welcome_pages#index'

	resources :customers do
		collection do
			get 'check_all'
			post 'generate_pdf'
		end
	end

  resources :stores
end
