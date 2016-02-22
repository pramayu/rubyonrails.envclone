class Software < ActiveRecord::Base
	has_many :softwarethemes
	has_many :themes, through: :softwarethemes
end
