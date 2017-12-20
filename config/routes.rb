Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  resource :kiosk, only: :show

  root to: 'kiosk#show'

  KioskController::DEPTS.pluck(:code).each do |d|
    get "/#{d}", to: "kiosk\##{d}"
  end

  # match '*path', to: 'kiosk:show', via: :get
end
