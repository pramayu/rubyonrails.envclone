class Compatibletheme < ActiveRecord::Base
  belongs_to :theme
  belongs_to :compatible
end
