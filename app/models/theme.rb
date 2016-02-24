class Theme < ActiveRecord::Base

	acts_as_taggable

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

	# paperclip thumb

	has_attached_file :thumb, styles: { large: "300x200#", medium: "80x80#" }
	validates_attachment_content_type :thumb, content_type: /\Aimage\/.*\Z/

	# upload preview
	has_many :assets

	# paperclip clip
	has_attached_file :clip
  validates_attachment_content_type :clip, content_type: ["application/zip", "application/rar"]

end
