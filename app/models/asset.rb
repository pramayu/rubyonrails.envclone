class Asset < ActiveRecord::Base
  belongs_to :theme
  
  has_attached_file :preview, styles: { xlarge: "1160x772#", large: "580x386#", medium: "90x60#" }
  validates_attachment_content_type :preview, content_type: /\Aimage\/.*\Z/
end
