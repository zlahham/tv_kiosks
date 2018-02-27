Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  resource :kiosk, only: :show

  root to: 'kiosk#show'

  get "/token/:name", to: "screens#show"

  get "/:code", to: "kiosk#show"

  mount ActionCable.server, at: '/cable'
end
