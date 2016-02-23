class Devicetheme < ActiveRecord::Base
  belongs_to :theme
  belongs_to :device
end
