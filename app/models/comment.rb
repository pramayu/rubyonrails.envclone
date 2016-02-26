class Comment < ActiveRecord::Base
  belongs_to :theme
  belongs_to :user
end
