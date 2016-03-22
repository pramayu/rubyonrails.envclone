class Order < ActiveRecord::Base
	has_many :order_themes
	before_save :update_subtotal

	def subtotal
		order_themes.collect { |i| i.valid? ? ( 1 * i.unit_price) : 0 }.sum
	end
private
	def update_subtotal
		self[:subtotal] = subtotal
	end
end
