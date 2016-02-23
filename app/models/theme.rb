class Theme < ActiveRecord::Base

	# category and subcategory to themes
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

	# framework to themes
	has_many :frameworkthemes
	has_many :frameworks, through: :frameworkthemes

	# software to themes
	has_many :softwarethemes
	has_many :softwares, through: :softwarethemes

	# email to themes
	has_many :emailthemes
	has_many :emails, through: :emailthemes

	# device to themes
	has_many :devicethemes
	has_many :devices, through: :devicethemes

end
