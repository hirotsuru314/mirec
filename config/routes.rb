Rails.application.routes.draw do
  get 'welcome/index'

  root to: 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'auth/:provider/callback' => 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'user_articles', to: 'top_pages#index'
end
