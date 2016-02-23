class Device < ActiveRecord::Base
  has_many :devicethemes
  has_many :themes, through: :devicethemes
end
