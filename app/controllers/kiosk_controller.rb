class KioskController < ApplicationController
  # List of all departments within the faculty of engineering
  DEPTS = Department.all
  ENG_DEPTS = %w[chemeng civil compsci eleceng mecheng].freeze

  # Through meta-programming, this sets dynamic controller actions for each
  # department. e.g. Computer Science would now have an action method named
  # compsci

  DEPTS.each do |d|
    define_method(:"#{d.code}") do
      @department = d.code
      @colour = d.colour
      @twitter_handle = d.twitter_handle
      @news_feed = 'engineering_feed' if ENG_DEPTS.include?(d.code)
      render action: :show
    end
  end

  def show
    @ucl_logo = 'ucl_logo.png' if @ucl_logo.blank?
  end
end
