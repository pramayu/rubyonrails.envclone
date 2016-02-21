class Fileinclude < ActiveRecord::Base
	has_many :fileincludethemes
	has_many :themes, through: :fileincludethemes
end
