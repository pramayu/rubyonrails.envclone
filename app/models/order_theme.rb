class OrderTheme < ActiveRecord::Base
  belongs_to :theme
  belongs_to :order

  before_save :finalize

  def unit_price
  	if persisted?
  		self[:unit_price]
  	else
  		theme.price
  	end
  end

  def total_price
  	unit_price * 1
  end

private
	def product_present
		if theme.nil?
			errors.add(:theme, "is not valid or is not active")
		end
	end

	def order_present
		if order.nil?
			errors.add(:theme, "is not valid or is not active")
		end
	end

	def finalize
		self[:unit_price] = unit_price
		self[:total_price] = 1 * self[:unit_price]
	end
end
