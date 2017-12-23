Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  resource :kiosk, only: :show

  root to: 'kiosk#show'

  KioskController::DEPTS.each do |d|
    get "/#{d}", to: "kiosk\##{d}"
  end

  mount ActionCable.server, at: '/cable'
end
