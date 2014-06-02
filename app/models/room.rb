class Room < ActiveRecord::Base
  attr_accessible :name, :public, :sessionId
  has_many :appointments
  belongs_to :dietitian
end
