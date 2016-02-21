class Browsertheme < ActiveRecord::Base
  belongs_to :theme
  belongs_to :browser
end
