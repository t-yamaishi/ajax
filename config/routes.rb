Rails.application.routes.draw do
  resources :blogs do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
end
