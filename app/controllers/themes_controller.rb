class ThemesController < ApplicationController

	before_action :find_themes, only: [:show, :edit, :update, :delete, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :find_category

	layout "themes"

	def index
		if params[:tag]
			@themes = Theme.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 30)
		elsif params[:browser]
			@themes = Theme.browser_with(params[:browser]).paginate(:page => params[:page], :per_page => 30)
		elsif params[:compatible]
			@themes = Theme.compatible_with(params[:compatible]).paginate(:page => params[:page], :per_page => 30)
		elsif params[:fileinclude]
			@themes = Theme.fileinclude_with(params[:fileinclude]).paginate(:page => params[:page], :per_page => 30)
		elsif params[:device]
			@themes = Theme.device_with(params[:device]).paginate(:page => params[:page], :per_page => 30)
		elsif params[:categories]
			@themes = Theme.where("category_id in (?)", params[:categories]).paginate(:page => params[:page], :per_page => 30)
		else
			@themes = Theme.all.order("created_at desc").paginate(:page => params[:page], :per_page => 30)
		end
	end

	def show
		@comments = Comment.where(theme_id: @theme)
		@themes = Theme.all.order("created_at desc")
		@random_themes = Theme.all.where(user_id: @theme.user.id).where.not(id: @theme.id).order("created_at").limit(2)
	end

	def new
		@theme = current_user.themes.build
		@theme.assets.build
		# @themeview = @theme.themeviews.build
		# respond_to do |format|
		# 	format.html
		# 	format.json
		# end
	end

	def create
		@theme = current_user.themes.build(theme_params)
		if @theme.save
			# params[:themeviews]['previewer'].each do |a|
			# 	@themeview = @theme.themeviews.create!(:previewer => a)
			# end
			redirect_to edit_theme_path(@theme)
		else
			render 'new'
		end
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
	end

	def edit
		@theme.assets.build
		respond_to do |format|
			format.html
			format.json
		end
	end

	def update
		if @theme.update(theme_params)
			if params[:previews]
				params[:previews].each { |preview| @theme.assets.create(preview: preview) }
			end
			redirect_to theme_path(@theme)
		else
			render 'edit'
		end
	end

	def destroy
		
	end

  def upvote
  	@Theme = Theme.find(params[:id])
    @theme.upvote_by current_user
    respond_to do |format|
    	format.html { redirect_to :back }
    	format.json { head :no_content }
    	format.js { render :layout => false }
    end
  end

  def downvote
    @theme.downvote_by current_user
    respond_to do |format|
    	format.html { redirect_to :back }
    	format.json { head :no_content }
    	format.js { render :layout => false }
    end
  end

	private

	def theme_params
		params.require(:theme).permit(:name, :description, :price, :tag_list, :resolution, :thumb, :message, :layered, :adobe, :pixel, :clip, :print, :widget, :layout, :demo, :column, :category_id, :subcategory_id, browser_ids: [], compatible_ids: [], device_ids: [], email_ids: [], fileinclude_ids: [], framework_ids: [], software_ids: [] )
	end

	def find_themes
		@theme = Theme.find(params[:id])
	end

	def find_category
		@category = Category.find_by_id(params[:category_id])
	end
end
