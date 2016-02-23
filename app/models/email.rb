class Email < ActiveRecord::Base
	has_many :emailthemes
	has_many :themes, through: :emailthemes
end
