Gazpacho::Application.routes.draw do

  # get "home/index"
  # get 'login' => 'sessions#new', as: :login
  # get 'logout' => 'sessions#destroy', as: :logout
  # get 'signup' => 'users#new', as: :signup
  # get 'questions.:form_id' => 'questions#index'
  # get 'answers/new.:question_id' => 'answers#new'

  get 'login' => redirect('/#/login'), as: :login
  get 'logout' => 'sessions#destroy', as: :logout

  get 'forms' => redirect('/#/forms'), as: :forms
  get 'projects' => redirect('/#/projects'), as: :projects

  #Fomrs
  # resources :users
  # resources :sessions

  scope "api", defaults: { format: :json } do
    resources :forms
    resources :answers
    resources :users
    resources :projects
    resources :questions
    resources :sessions do
      get 'verify_session', :member
    end
  end

  root 'home#index'

  # get "/*path" => redirect("/#%{path}")

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
