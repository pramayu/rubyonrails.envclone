class CommentsController < ApplicationController
	def create
		@theme = Theme.find(params[:theme_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.theme_id = @theme.id
		respond_to do |format|
			if @comment.save
				format.html { redirect_to theme_path(@theme) }
				format.json
				format.js
			else
				format.html { render 'new' }
				format.json
				format.js
			end
		end
	end
end
