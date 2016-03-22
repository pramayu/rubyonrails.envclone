class OrderThemesController < ApplicationController
	def create
		@order = current_order
		@order_theme = @order.order_themes.new(order_theme_params)
		@order.save
		session[:order_id] = @order.id
	end

	def update
		@order = current_order
		@order_theme = @order.order_themes.find(params[:id])
		@order_theme.update_attributes(order_theme_params)
		@order_themes = @order.order_themes
	end

	def destroy
		@order = current_order
		@order_theme = @order.order_themes.find(params[:id])
		@order_theme.destroy
		@order_themes = @order.order_themes
	end

	private

	def order_theme_params
		params.require(:order_theme).permit(:theme_id)
	end
end