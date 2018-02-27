class ScreensController < ApplicationController

	ENG_DEPTS = %w[chemeng civil compsci eleceng mecheng].freeze

	def show

		screen = Screen.where(name: params[:name]).first!

		@department = screen.department

		@news_feed = 'engineering_feed' if ENG_DEPTS.include?(@department.code)

		@ucl_logo = 'ucl_logo.png' if @ucl_logo.blank?

		render 'kiosk/show'

	end

end
