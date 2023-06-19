Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    resources :users
    resources :groups, except: [:new] do
      resources :invitations, except: [:show]
      resources :plans
      delete 'delete_member'
    end
  end
  namespace :admin do
    get '/' => 'homes#top'
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :groups, only: [:index, :show, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
