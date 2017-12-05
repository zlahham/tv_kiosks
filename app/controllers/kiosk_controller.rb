class KioskController < ApplicationController
  def show; end
  def testing
    render action: :show
  end
end
