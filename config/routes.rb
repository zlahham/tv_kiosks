Rails.application.routes.draw do
  devise_for :users
  root to: 'kiosk#show'

  resource :kiosk
end
