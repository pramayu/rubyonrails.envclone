class Fileincludetheme < ActiveRecord::Base
  belongs_to :theme
  belongs_to :fileinclude
end
