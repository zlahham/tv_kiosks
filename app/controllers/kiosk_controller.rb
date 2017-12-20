class KioskController < ApplicationController
  # List of all departments within the faculty of engineering
  DEPTS = Department.all
  ENG_DEPTS = %w[chemeng civil compsci eleceng mecheng].freeze

  DEPTS.each do |d|
    define_method(:"#{d.code}") do
      @department = d.code
      @colour = d.colour
      @news_feed = 'engineering_feed' if ENG_DEPTS.include?(d.code)
      render action: :show
    end
  end

  def show
    @ucl_logo = 'ucl_logo.png' if @ucl_logo.blank?
  end
end
