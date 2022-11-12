Rails.application.routes.draw do

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
# 管理者用
# URL /admin/sign_in ...
devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
root to: 'homes#top'
get '/tos' => 'homes#tos' #利用規約
get '/policy' => 'homes#policy' #プライバシーポリシー
get '/end_users/helps' => 'end_users#helps' 
get "search" => "searches#search" #検索機能

resources :post_images ,only:[:index, :show, :destroy]
resources :post_comments ,only:[:destroy]
resources :end_users ,only:[:index, :show, :edit, :update]
resources :helps ,only:[:index]

end

# 利用者用
# URL /end_users/sign_in ...
devise_for :end_users,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do

root to: 'homes#top'

get '/end_users/my_page' => 'end_users#show'
get '/end_users/information/edit' => 'end_users#edit' #利用者の登録情報編集画面
patch 'end_users/information' => 'end_users#update' #利用者の登録情報更新
get '/end_users/unsubscribe' => 'end_users#unsubscribe' #利用者の退会確認画面
patch '/end_users/withdraw' => 'end_users#withdraw' #利用者の退会処理(ステータスの更新)
get '/end_users/helps' => 'end_users#helps' #help一覧表示
get "search" => "searches#search" #検索機能
resources :post_images do
resource :helps ,only:[:create, :destroy]
resources :post_comments ,only:[:create, :destroy]
end

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#get 'maps/index'
#root to: 'maps#index'
#resources :maps, only: [:index]
