class Question < ActiveRecord::Base
  belongs_to :survey
  attr_accessible :choices, :type, :content
end
