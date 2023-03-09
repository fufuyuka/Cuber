Rails.application.routes.draw do
  namespace :admin do
    get 'searches/index'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'contacts/index'
    get 'contacts/edit'
  end
  namespace :public do
    get 'searches/index'
  end
  namespace :public do
    get 'bookmarks/index'
  end
  namespace :public do
    get 'favorites/index'
  end
  namespace :public do
    get 'posts/show'
    get 'posts/index'
  end
  namespace :public do
    namespace :user do
      get 'settings/show'
      get 'settings/edit'
    end
  end
  namespace :public do
    namespace :user do
      get 'profiles/show'
      get 'profiles/edit'
    end
  end
  namespace :public do
    get 'homes/new'
  end
# ユーザー用
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end
