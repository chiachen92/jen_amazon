Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root :to => 'home#index'
  get '/' => 'home#index', as: :home
  get '/about' => 'home#about'
  get '/contact' => 'home#contact'
  post '/contact_submit' => 'home#contact_submit'

  resources :products do
    resources :reviews, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end


    #  has to be this format nested resources, ask
    # reviews routes has /products/:product_id as part of the url. This is so that when I am creating an answer, I can get that id to find the product and associate it with the review

  resources :favorites, only: [:create, :destroy]
  end

  resources :tags

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
    # because we don't have an id
  end



end
