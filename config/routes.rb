Rails.application.routes.draw do
	root to: 'index#index'
	resources :tracks, only: [:index, :show]
	resources :artists, only: [:index, :show]
	
end
