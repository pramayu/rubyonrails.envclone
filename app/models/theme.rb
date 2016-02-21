class Theme < ActiveRecord::Base
	belongs_to :category
	belongs_to :subcategory

	# browser to themes
	has_many :browserthemes
	has_many :browsers, through: :browserthemes

	# compatible to themes
	has_many :compatiblethemes
	has_many :compatibles, through: :compatiblethemes

	# files include to themes
	has_many :fileincludethemes
	has_many :fileincludes, through: :fileincludethemes

end
