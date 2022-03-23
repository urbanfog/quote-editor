Rails.application.routes.draw do
  devise_for :users
  resources :quotes do
    resources :line_item_dates, except: [:show, :index] do
      resources :line_items, except: [:show, :index]
    end
  end

  root "pages#home"
end
