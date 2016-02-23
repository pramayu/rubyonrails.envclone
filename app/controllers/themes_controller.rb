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
		respond_to do |format|
			format.html
			format.json
		end
	end

	def update
		if @theme.update(theme_params)
			redirect_to theme_path(@theme)
		else
			render 'edit'
		end
	end

	def destroy
		
	end

	private

	def theme_params
		params.require(:theme).permit(:name, :description, :price, :resolution, :layered, :adobe, :pixel, :print, :widget, :layout, :demo, :column, :category_id, :subcategory_id, browser_ids: [], compatible_ids: [], device_ids: [], email_ids: [], fileinclude_ids: [], framework_ids: [], software_ids: [] )
	end

	def find_themes
		@theme = Theme.find(params[:id])
	end
end