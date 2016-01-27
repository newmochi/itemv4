Itemlist::Application.routes.draw do
  root to: "top#index"
#  get "about" => "top#about", as: "about"
#getよりmatchの方が静的ルートには慣例的に使用
#Ruby on Rails チュートリアル Michael Hartlより
#えらーなので4.1.2では消した  match "about" => "top#about", as: "about"
  get "about" => "top#about", as: "about"


  resources :members, only: [ :index, :show ] do
    collection { get "search" }
  end

  resources :articles do
#    collection { get "download" }
    collection do
      get "download"
      get "search"
    end

  end
  resource :session, only: [:create, :destroy]

  namespace :admin do
    root to: "top#index"
    resources :members do
      collection { get "search" }
    end
    resources :articles do #全フィールド変更用に
#      collection { get "download" }
      collection do
        get "download"
        get "search"
      end
    end
  end

  resource :account, only: [:show, :edit, :update]

#えらーなので4.1.2では消した  match "*anything" => "top#not_found"

end
