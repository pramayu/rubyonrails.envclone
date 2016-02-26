class Theme < ActiveRecord::Base

	acts_as_taggable

  belongs_to :user
  has_many :comments

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

	# sort browser
  	def self.browser_with(name)
  		Browser.find_by_name!(name).themes  		
  	end

  	def self.browser_counts
  		Browser.select("browsers.*, count(browserthemes.browser_id) as count").
  		joins(:browserthemes).group(browserthemes.browser_id)
  	end

  	def browser_list
  		browsers.map(&:name).join(", ")
  	end

  	def browser_list=(names)
  		self.browsers = names.split(",").map do |n|
  			Browser.where(name: n.strip).first_or_create!
  		end
  	end

  	# sort compatible
  	def self.compatible_with(name)
  		Compatible.find_by_name!(name).themes  		
  	end

  	def self.compatible_counts
  		Compatible.select("compatibles.*, count(compatiblethemes.compatible_id) as count").
  		joins(:compatiblethemes).group(compatiblethemes.compatible_id)
  	end

  	def compatible_list
  		compatibles.map(&:name).join(", ")
  	end

  	def compatible_list=(names)
  		self.compatibles = names.split(",").map do |n|
  			Compatible.where(name: n.strip).first_or_create!
  		end
  	end

  	# sort fileinclude
    def self.fileinclude_with(name)
      Fileinclude.find_by_name!(name).themes     
    end

    def self.fileinclude_counts
      Fileinclude.select("fileincludes.*, count(fileincludethemes.fileinclude_id) as count").
      joins(:fileincludethemes).group(fileincludethemes.fileinclude_id)
    end

    def fileinclude_list
      fileincludes.map(&:name).join(", ")
    end

    def fileinclude_list=(names)
      self.fileincludes = names.split(",").map do |n|
        Fileinclude.where(name: n.strip).first_or_create!
      end
    end

    # sort device
    def self.device_with(name)
      Device.find_by_name!(name).themes     
    end

    def self.device_counts
      Device.select("devices.*, count(devicethemes.device_id) as count").
      joins(:devicethemes).group(devicethemes.device_id)
    end

    def device_list
      devices.map(&:name).join(", ")
    end

    def device_list=(names)
      self.devices = names.split(",").map do |n|
        Device.where(name: n.strip).first_or_create!
      end
    end
end
