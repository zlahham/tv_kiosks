class KioskController < ApplicationController
  # List of all departments within the faculry of engineering
  DEPTS = %w[biochem chemeng civil compsci eleceng mecheng medphys stepp crimesci management].freeze

  DEPTS.each do |d|
    define_method(:"#{d}") {
      @ucl_logo = "ucl_logo_#{d}.png"
      render action: :show
    }
  end

  def show
    if @ucl_logo.blank?
      @ucl_logo = 'ucl_logo.png'
    end
  end


end
