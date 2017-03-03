Rails.application.routes.draw do
  root 'songs#index'
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :songs do
    member do
      post 'add_song'
    end
  end

  resources :users, only: [:index, :show] do
    resources :user_songs
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
