class CommentsController < ApplicationController
	def create
		@theme = Theme.find(params[:theme_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.theme_id = @theme.id

		if @comment.save
			redirect_to theme_path(@theme)
		else
			render 'new'
		end
	end
end
