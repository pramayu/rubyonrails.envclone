class Softwaretheme < ActiveRecord::Base
  belongs_to :theme
  belongs_to :software
end
