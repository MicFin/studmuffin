class Survey < ActiveRecord::Base
  attr_accessible :title

  has_many :user_surveys
  has_many :users, through: :user_surveys
end
