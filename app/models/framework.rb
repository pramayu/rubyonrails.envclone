class Framework < ActiveRecord::Base
	has_many :frameworkthemes
	has_many :themes, through: :frameworkthemes
end
