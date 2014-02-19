class Note < ActiveRecord::Base
  attr_accessible :name, :content
  belongs_to :user
end
