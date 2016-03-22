class DashboardController < ApplicationController
	before_action :find_user, only: [ :index, :show, :profile, :following, :follower, :portofolio, :favorite, :follow_feed]
	before_action :authenticate_user!, except: [:profile, :portofolio]

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

	def following

	end

	def follower

	end

	def portofolio
		@themes = @user.themes.order("created_at desc").paginate(:page => params[:page], :per_page => 30)
	end

	def favorite

	end

	def follow_feed
		@follow_feeds = @user.friendships
	end

	private

	def theme_params
		params.require(:theme).permit(:category_id, :subcategory_id)
	end

	def find_user
		@user = User.find_by_id(params[:id])
	end
end