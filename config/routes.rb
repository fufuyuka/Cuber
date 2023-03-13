Rails.application.routes.draw do

# ユーザー用
devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  scope module: :public do
    root to: "homes#top"
    get "/top/searchs" => "homes#search"
    get "/contacts/new" => "homes#new"
    post "/contacts/create" => "homes#create"
    get "/contacts/completion" => "homes#completion"
    get "/terms" => "homes#terms"
    get "/management" => "homes#management"
    namespace :user do
      get "/profile/:id" => "profiles#show"
      resource :profiles, only: [:edit,:update]
      get "/sign_out" => "settings#logout"
      patch "/withdrawal" => "settings#withdrawal"
      get "/withdrawal" => redirect("/")
      resource :settings, only: [:edit,:update]
    end
    get "/favorites" => "favorites#index"
    get "/bookmarks" => "bookmarks#index"
    resources :posts, only: [:create,:show,:index,:destroy] do
      resource :favorites, only: [:create,:destroy]
      resource :bookmarks, only: [:create,:destroy]
      resources :post_comments, only: [:create,:index,:destroy]
    end
    get "/searches" => "searches#index"
  end

# 管理者用
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    root to: "homes#top"
    get "/logout" => "homes#logout" #管理者のログアウト完了ページ
    resources :contucts, only: [:index, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
    resources :searches, only: [:index]
  end
end
