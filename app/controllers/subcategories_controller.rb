class SubcategoriesController < ApplicationController
	# before_action :all_usr
	layout "themes"
	def index
		if params[:subcategories]
			@themes = Theme.where("subcategory_id in (?)", params[:subcategories]).paginate(:page => params[:page], :per_page => 30)
		else
			@themes = Theme.all.paginate(:page => params[:page], :per_page => 30)
		end
		@subcategory = Subcategory.find_by_id(params[:subcategory_id])
	end

	private

	# def all_usr
	# 	@users = User.all
	# end
end