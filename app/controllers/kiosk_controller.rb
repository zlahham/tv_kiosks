class KioskController < ApplicationController
  # List of all departments within the faculty of engineering
  DEPTS = %w[biochem chemeng civil compsci eleceng mecheng medphys stepp crimesci management].freeze

  DEPTS.each do |d|
    define_method(:"#{d}") do
      @ucl_logo = "ucl_logo_#{d}.png"
      @department = d
      @news_feed = 'engineering_feed' if %w[biochem chemeng civil compsci eleceng mecheng].include?(d)
      render action: :show
    end
  end

  def show
    @ucl_logo = 'ucl_logo.png' if @ucl_logo.blank?
    @department = 'no_department' if @department.blank?
  end
end
