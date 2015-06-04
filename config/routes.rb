Rails.application.routes.draw do
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
  
  root 'login#login'
  get  'login' => 'login#login'
  post  'login/auth' => 'login#auth'
  get 'login/logout' => 'login#logout'
  
  get 'user/new' => 'user#new'
  post 'user/create' => 'user#create'
  get 'user/profile' => 'user#profile'
  patch 'user/update_profile' => 'user#update_profile'
  patch 'user/update_password' => 'user#update_password'
  
  get 'order/index' => 'order#index'
  post 'order/order' => 'order#order'
  
  get 'admin/users_index' => 'admin#users_index'
  post 'admin/user_edit' => 'admin#user_edit'
  patch 'admin/user_update' => 'admin#user_update'
  post 'admin/user_delete' => 'admin#user_delete'
  
  get 'admin/books_index' => 'admin#books_index'
  post 'admin/book_edit' => 'admin#book_edit'
  patch 'admin/book_update' => 'admin#book_update'
  get 'admin/book_new' => 'admin#book_new'
  post 'admin/book_create' => 'admin#book_create'
  
  get 'admin/announcement_index' => 'admin#announcement_index'
  post 'admin/announcement_edit' => 'admin#announcement_edit'
  patch 'admin/announcement_update' => 'admin#announcement_update'
  get 'admin/announcement_new' => 'admin#announcement_new'
  post 'admin/announcement_create' => 'admin#announcement_create'
  
  get 'admin/order_index' => 'admin#order_index'
  post 'admin/order_edit' => 'admin#order_edit'
end
