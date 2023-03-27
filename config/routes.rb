Rails.application.routes.draw do

# ユーザー用
devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  scope module: :public do
    root to: "homes#top"
    get "/top/searches" => "homes#search"
    get "/contacts/new" => "homes#new"
    post "/contacts/create" => "homes#create"
    get "/contacts/completion" => "homes#completion"
    get "/terms" => "homes#terms"
    get "/management" => "homes#management"
    namespace :user do
      get "/profile/:id" => "profiles#show"
      resource :profiles, only: [:edit,:update]
      get "/logout" => "settings#logout"
      patch "/withdrawal" => "settings#withdrawal"
      get "/withdrawal" => redirect("/") #退会直後のみ
      resource :settings, only: [:edit,:update]
      get "/settings" => "settings#edit"
    end
    get "/:user_id/favorites" => "favorites#index", as: 'favorites'
    get "/bookmarks" => "bookmarks#index"
    get "/:user_id/post_comments" => "post_comments#index", as: 'comments'
    resources :posts, only: [:create,:show,:index,:destroy] do
      resource :favorites, only: [:create,:destroy]
      resource :bookmarks, only: [:create,:destroy]
      resources :post_comments, only: [:create,:destroy]
    end
    get "/searches" => "searches#index"
  end

# 管理者用
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    get "/logout" => "homes#logout" #管理者のログアウト完了ページ
    root to: "contacts#index"
    resources :contacts, only: [:edit, :update]
    get "/:user_id/posts" => "posts#index", as: 'posts'
    resources :posts, only: [:destroy]
    get "/:user_id/post_comments" => "post_comments#index", as: 'post_comments'
    resources :post_comments, only: [:destroy]
    resources :users, only: [:index, :show, :edit, :update] 
    resources :searches, only: [:index]
  end
  
#ゲストユーザー用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
