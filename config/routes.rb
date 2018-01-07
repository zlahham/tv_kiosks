Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  resource :kiosk, only: :show

  root to: 'kiosk#show'

  if defined?(Department) && Department.any?
    Department.all.pluck(:code).each do |d|
      get "/#{d}", to: "kiosk\##{d}"
    end
  end

  mount ActionCable.server, at: '/cable'
end
