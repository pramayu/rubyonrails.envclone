class DashboardController < ApplicationController
	before_action :find_user, only: [ :index, :show, :profile]
	before_action :authenticate_user!, except: [:profile]

	layout "themes"

	def show
		@themes = @user.themes.paginate(:page => params[:page], :per_page => 30)
		@theme = current_user.themes.build
	end

	def create
		@theme = current_user.themes.build(theme_params)
		if @theme.save
			# params[:themeviews]['previewer'].each do |a|
			# 	@themeview = @theme.themeviews.create!(:previewer => a)
			# end
			redirect_to edit_theme_path(@theme)
		else
			render 'show'
		end
	end

	def profile
		
	end

	private

	def theme_params
		params.require(:theme).permit(:category_id, :subcategory_id)
	end

	def find_user
		@user = User.find_by_id(params[:id])
	end
end