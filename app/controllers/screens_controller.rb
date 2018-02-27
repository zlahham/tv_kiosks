class ScreensController < ApplicationController

	def show

		@screen = Screen.where(name: params[:name]).first!

		render html: @screen.id

	end

end
