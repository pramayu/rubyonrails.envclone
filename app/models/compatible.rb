class Compatible < ActiveRecord::Base
	has_many :compatiblethemes
	has_many :themes, through: :compatiblethemes
end
