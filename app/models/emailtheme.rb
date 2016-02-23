class Emailtheme < ActiveRecord::Base
  belongs_to :theme
  belongs_to :email
end
