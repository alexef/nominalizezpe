Rails.application.routes.draw do
  resources :user
  resources :votes
  resources :people
  resources :openings

  get 'welcome/index'

  root 'welcome#index'
  match '/terms' => 'welcome#terms', via: [:get]
  match '/about' => 'welcome#about', via: [:get]
  match '/result' => 'welcome#result', via: [:get]
  match '/contact' => 'welcome#contact', via: [:get]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'moderator/index'
  get 'moderator/:id/ok' => 'moderator#make_ok', as: :make_ok
  get 'moderator/:id/reject' => 'moderator#make_reject', as: :make_reject
  get 'moderator/:id/new' => 'moderator#make_new', as: :make_new
  get 'moderator/users' => 'moderator#users', as: :users

  get ':encoded_name' => 'people#show_by_name', as: :person_by_name

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
