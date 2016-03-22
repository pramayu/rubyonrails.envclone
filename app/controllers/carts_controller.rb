class CartsController < ApplicationController
	layout "themes"
	def show
		@order_themes = current_order.order_themes
	end
end