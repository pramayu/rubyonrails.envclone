class Category < ActiveRecord::Base
	has_many :themes
	has_many :subcategories
end
