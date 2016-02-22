class Frameworktheme < ActiveRecord::Base
  belongs_to :theme
  belongs_to :framework
end
