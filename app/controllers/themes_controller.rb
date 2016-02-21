class ThemesController < ApplicationController

	before_action :find_themes, only: [:show, :edit, :update, :delete]

	def index
		
	end

	def show
		
	end

	def new
		@theme = Theme.new
		# @themeview = @theme.themeviews.build
		# respond_to do |format|
		# 	format.html
		# 	format.json
		# end
	end

	def create
		@theme = Theme.new(theme_params)
		if @theme.save
			# params[:themeviews]['previewer'].each do |a|
			# 	@themeview = @theme.themeviews.create!(:previewer => a)
			# end
			redirect_to edit_theme_path(@theme)
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		
	end

	def delete
		
	end

	private

	def themes_params
		params.require(:theme).permit(:name, :description, :price, :resolution, :layout, :demo, :category_id, :subcategory_id)
	end

	def find_themes
		@theme = Theme.find(params[:id])
	end
end