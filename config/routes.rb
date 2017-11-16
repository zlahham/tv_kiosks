Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  resource :kiosk

  root to: 'kiosk#show'
end
