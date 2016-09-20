Rails.application.routes.draw do
  get 'relationships/follow_user'

  get 'relationships/unfollow_user'

  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts do
    resources :comments
    member do
      get 'like'
    end
  end

  get 'notifications', to: 'notifications#index'
  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile
  post ':user_name/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':user_name/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  root 'posts#index'
end
