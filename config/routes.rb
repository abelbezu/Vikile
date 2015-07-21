Rails.application.routes.draw do

  devise_for :accounts
  mount Ckeditor::Engine => '/ckeditor'
  

  
  resources :articles do 
   
  end


  match '/search_results' => 'articles#search_results', :via => [:get]


  # match '/:controller(/:action(/:id))', :via => [:get, :post, :patch]
  
  get 'profile', to: 'accounts#index' 
 
  
  root "articles#index"

  match 'auth/:provider/callback', to: 'sessions#create', :via => [:get, :post]
  match 'auth/failure', to: redirect('/') , :via => [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout' , :via => [:get, :post]
  match '/articles/edit_admin/:id', :action => 'edit_admin', :via => [:get], :controller => 'articles'
  match '/admin/articles', :action => 'articles', :via => [:get], :controller => 'admin'
  match '/admin', :action => 'index', :via => [:get], :controller => 'admin'
  match '/admin/accounts', :action => 'accounts', :via => [:get], :controller => 'admin'
  match '/admin/stats', :action => 'stats', :via => [:get], :controller => 'admin'
  match '/admin/create_admin', :action => 'create_admin', :via => [:get], :controller => 'admin'
  match '/admin/images', :action => 'images', :via => [:get], :controller => 'admin'
  match '/admin/stats_redirects', :action => 'stats_redirects', :via => [:get], :controller => 'admin'
  match '/admin/stats_users', :action => 'stats_users', :via => [:get], :controller => 'admin'
  match '/admin/stats_articles', :action => 'stats_articles', :via => [:get], :controller => 'admin'
  match '/admin/version_diff/:id', :action => 'version_diff', :via => [:get], :controller => 'admin'
  match '/admin/admin_edit/:id', :action => 'admin_edit', :via => [:get], :controller => 'admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
