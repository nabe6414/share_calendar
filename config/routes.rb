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
    resources :groups do
      resources :invitations
      delete 'delete_member'
    end
  end
  namespace :admin do
    get '/' => 'homes#top'
    resources :users
    resources :groups
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
