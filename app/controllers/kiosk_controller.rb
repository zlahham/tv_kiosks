class KioskController < ApplicationController
  # List of all departments within the faculty of engineering
  ENG_DEPTS = %w[chemeng civil compsci eleceng mecheng].freeze

  def show

    @department = Department.where(code: params[:code]).first!

    @news_feed = 'engineering_feed' if ENG_DEPTS.include?(@department.code)

    @ucl_logo = 'ucl_logo.png' if @ucl_logo.blank?

  end
end
