class Browser < ActiveRecord::Base
	has_many :browserthemes
	has_many :themes, through: :browserthemes
end
