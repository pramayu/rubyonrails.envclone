class CategoriesController < ApplicationController
	layout "themes"

	def index
		if params[:categories]
			@themes = Theme.where("category_id in (?)", params[:categories]).paginate(:page => params[:page], :per_page => 30)
		else
			@themes = Theme.all.paginate(:page => params[:page], :per_page => 30)
		end
		@category = Category.find_by_id(params[:category_id])
	end

end